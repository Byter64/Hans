#include "Helga.h"

enum state {
    whitespace,
    symbol,
    inline_comment,
    outline_comment,
} state = whitespace;

enum expecting {
    newlabel_function,
    dest,
    source1,
    source2,
    label,
} expecting = newlabel_function;

enum q2type {
    intreg,
    floatreg,
    immediate,
};

enum optype {
    arith,
    cmp,
    bitwise,
    special,
    jmp,
};

enum error {
    valid,
    invalid_name,
    invalid_immediate,
    invalid_reg,
    invalid_label,
};

struct instruction {
    int line;
    enum q2type q2type;
    enum optype optype;
    uint8_t opcode;
    int z;
    int q1;
    int q2;
    enum error errorcode;
} typedef instruction;

struct label {
    char *name;
    int pc;
} typedef label;

const char *arith_codes[] = {"add", "sub", "mul", "div", "mod", "sqrt", "sl", "sr", "slc", "src"};
const int arith_codes_num = 10;
const char *cmp_codes[] = {"ce", "cne", "cg", "cge", "cl", "cle"};
const int cmp_codes_num = 6;
const char *bitwise_codes[] = {"not", "and", "or", "xor", "xnor"};
const int bitwise_codes_num = 5;
const char *special_codes[] = {"ld", "store", "jreg", "bez", "jal"};
const int special_codes_num = 5;

int main(int argc, char* argv[]) {

    FILE *progtxt;
    FILE *progbin;
    char *filename;
    //get filename
    if(argc < 2) {
        filename = "prog.txt";
    } else {
        filename = strdup(argv[1]);
    }

    //open txt file
    progtxt = fopen(filename, "r");
    if(progtxt == NULL) {
        printf("Failed to open %s for reading", filename);
        return 1;
    }
    int line = 1;
    char buffer[256];
    int index = 0;
    char ch;
    while(ch = fgetc(progtxt) != EOF) {
        //increase line counter
        if(ch == '\n')
            line++;
        switch (state) {
        case inline_comment:
            if(ch == '\n')
                state = whitespace;
            break;
        case outline_comment:
            switch(ch) {
            case '*':
                buffer[0] = '*';
                break;
            case '/':
                if(buffer[0] == '*')
                    state = whitespace;
            default:
                buffer[0] = '\0';
            }
        case whitespace:
            if(is_special_char(ch)) {
                printf("\nUnexpected %c in line %d", ch, line);
                fclose(progtxt);
                return 1;
            } else if(!isspace(ch)) {
                buffer[index++] = ch;
                state = symbol;
            } 
            break;
        case symbol:
            if(!(is_special_char(ch) || isspace(ch)))
                buffer[index++] = ch;
            else {
                //TODO buffer parsing
            }
            break;
        }
    }

    //close txt file
    fclose(progtxt);


    //open bin file
    strcpy(filename + strlen(filename) - 3, "bin");
    progbin = fopen(filename, "wb");
    if(progbin == NULL) {
        printf("\nFailed to open %s for writing", filename);
        return 1;
    }
    
    //close bin file
    fclose(progbin);

    return 0;
}


//takes a character as input and determines if it is whitespace
int is_special_char(char c) {
    return c == ',' || c == ':';
}

//takes the raw string of a name as input and outputs an instruction
//if the raw string is not recognized, errorcode of the returned instruction is set to invalid_name
instruction get_ins(char *str) {
    //convert string to lowercase
    instruction ins;
    int len = strlen(str);
    char *instr = strdup(str);
    for(int i = 0; i < len; i++)
        instr[i] = tolower(str[i]);
    
    //filter out i and .s
    if(strcmp(instr + len - 1, "i")) {
        ins.q2type = immediate;
        instr[--len] = '\0';
    } else if(strcmp(instr + len - 2, ".s")) {
        ins.q2type = floatreg;
        len -= 2;
        instr[len] = '\0';
    } else {
        ins.q2type = intreg;
    }
    
    uint8_t i;
    //check for arith code
    for(i = 0; i < arith_codes_num; i++) {
        if(strcmp(instr, arith_codes[i])) {
            ins.optype = arith;
            ins.opcode = i;
            ins.errorcode = valid;
            return ins;
        }
    }
    //check for cmp code
    for(i = 0; i < cmp_codes_num; i++) {
        if(strcmp(instr, cmp_codes[i])) {
            ins.optype = cmp;
            ins.opcode = i;
            ins.errorcode = valid;
            return ins;
        }
    }
    //check for bitwise code
    for(i = 0; i < bitwise_codes_num; i++) {
        if(strcmp(instr, bitwise_codes[i])) {
            ins.optype = bitwise;
            ins.opcode = i;
            ins.errorcode = valid;
            return ins;
        }
    }
    //check for special code
    for(i = 0; i < special_codes_num; i++) {
        if(strcmp(instr, special_codes[i])) {
            ins.optype = special;
            if(ins.q2type != floatreg)
                ins.opcode = i;
            else
                ins.opcode = i + 1;
            ins.q2type = immediate;
            ins.errorcode = valid;
            return ins;
        }
    }
    //check for jmp
    if(strcmp(instr, "jmp")) {
        ins.optype = jmp;
        ins.opcode = 0;
        ins.errorcode = valid;
        return ins;
    }
    //str is not a valid code
    ins.errorcode = invalid_name;
    return ins;
}

//take a number as input and set the in and out registers of the instruction
//if the numbers are out of bound, error code of the instruction is set to invalid_reg or invalid_immediate respectively
void set_z(instruction *ins, int num) {
    if(num > 31)
        ins->errorcode = invalid_reg;
    else
        ins->z = num;
}

void set_q1(instruction *ins, int num) {
    if(num > 31)
        ins->errorcode = invalid_reg;
    else
        ins->q1 = num;
}

void set_q2(instruction *ins, int num) {
    if(ins->q2type != immediate) {
        if(num > 31)
            ins->errorcode = invalid_reg;
        else
            ins->q2 = num;
    } else if(ins->optype == jmp) {
        if(num >= (1 << 26) || num < -(1 << 26))
            ins->errorcode = invalid_immediate;
        else
            ins->q2 = num;
    } else {
        if(num >= (1 << 16) || num < -(1 << 16))
            ins->errorcode = invalid_immediate;
        else
            ins->q2 = num;
    }
}

//takes an instruction as input and outputs it in binary
uint32_t get_bin(instruction ins) {
    uint32_t rep = 0;
    switch (ins.q2type) {
    case intreg:
        switch (ins.optype) {
        case cmp:
            rep |= 0b010000;
            break;
        case bitwise:
            rep |= 0b011000;
            break;
        }
        rep |= ins.opcode;
        break;
    case floatreg:
        rep |= 0b100000;
        rep |= ins.opcode;
        break;
    case immediate:
        switch (ins.optype) {
        case arith:
            rep |= (0b100000 << 26);
            break;
        case cmp:
            rep |= (0b110000 << 26);
            break;
        case bitwise:
            rep |= (0b111000 << 26);
            break;
        case special:
            rep |= (0b101000 << 26);
            ins.opcode += 0b010;
            break;
        case jmp:
            rep |= (0b010000 << 26);
            break;
        }
        rep |= (ins.opcode << 26);
        break;
    }
    
    rep |= (ins.z << 21);
    rep |= (ins.q1 << 16);
    if(ins.q2type != immediate)
        rep |= (ins.q2 << 11);
    else
        rep |= ins.q2;

    return rep;
}