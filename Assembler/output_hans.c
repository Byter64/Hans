#include "vasm.h"

#ifdef OUTIHEX && defined(VASM_CPU_HANS)

static char *copyright = "vasm Hans output module (c) 2023 by Yannik Stamm";
static const char* dataBlockMarker = "-";
static const char* dataMarker = "->";

static char int_to_ascii(int number)
{
    switch (number)
    {
    case 0: return '0';
    case 1: return '1';
    case 2: return '2';
    case 3: return '3';
    case 4: return '4';
    case 5: return '5';
    case 6: return '6';
    case 7: return '7';
    case 8: return '8';
    case 9: return '9';
    case 10: return 'A';
    case 11: return 'B';
    case 12: return 'C';
    case 13: return 'D';
    case 14: return 'E';
    case 15: return 'F';
    default: return '@';
    }
}

/*
/// <summary>
/// Converts the given 32-Bit Byte into Hexadecimal ascii and writes it to the buffer
/// </summary>
/// <param name="buffer">This buffer needs enough space for 9 chars</param>
/// <param name="byte"></param> */
static void write_byte_in_ascii(char* buffer, taddr byte)
{
    int index;
    for (index = 0; index < 8; index++)
    {
        taddr mask = 0b1111;
        taddr shiftedByte = byte >> (index * 4); 
        taddr number = shiftedByte & mask;/*number is now in [0, 15]*/
        buffer[7 - index] = int_to_ascii(number);
    }

    buffer[8] = '\0';
}

static void write_32bit_byte_to_file(FILE* file, taddr data)
{
    unsigned char buffer[9];

    write_byte_in_ascii(buffer, data);
    fprintf(file, buffer);
}

static void write_32bit_byte_to_file_from_pointer(FILE* file, unsigned char* first8Bit_Byte)
{
    taddr data = (*(first8Bit_Byte + 0)) << 24;
    data |= (*(first8Bit_Byte + 1)) << 16;
    data |= (*(first8Bit_Byte + 2)) << 8;
    data |= (*(first8Bit_Byte + 3)) << 0;

    write_32bit_byte_to_file(file, data);
}

static void write_output(FILE* file, section* firstSection, symbol* firstSymbol)
{
    int i, j;
    atom* atom;
    section* section;
    taddr currentAddress;

    fprintf(file, "Symbols:\n");
    /* Print list of all symbols and their value*/
    symbol* activeSymbol;
    for (activeSymbol = firstSymbol; activeSymbol != NULL; activeSymbol = activeSymbol->next)
    {
        if (activeSymbol->type == IMPORT)
        {
            fprintf(file, ".%s:?\n", activeSymbol->name);
        }
        else
        {
            fprintf(file, ".%s:%i\n", activeSymbol->name, activeSymbol->pc);
        }
    }

    fprintf(file, "\nSections:\n");

    for (section = firstSection; section != NULL; section = section->next)
    {
        fprintf(file, "%s:\n", section->name);
        fprintf(file, "\tRelocations:\n");
        unsigned int byteOffset = 0;
        for (atom = section->first; atom != NULL; atom = atom->next)
        {
            if (atom->type == DATA)
            {
                if (atom->content.db->relocs != NULL)
                {
                    if (atom->content.db->size > 1)
                        printf("WARNING: An atom has relocations but more than one byte. Program does not handle that properly!!!!\n");
                    rlist* listEntry = atom->content.db->relocs;
                    for (; listEntry != NULL; listEntry = listEntry->next)
                    {
                        nreloc* reloc = listEntry->reloc;
                        fprintf(file, "\t\t<%i,%i,%i,%i,%i,%s>\n", reloc->byteoffset + byteOffset, reloc->bitoffset, reloc->size, reloc->mask, reloc->addend, reloc->sym->name);
                    }
                }

            }
            else if (atom->type == SPACE)
            {
                for (i = 0; i < atom->content.sb->space; i++)
                {
                    for (j = 0; j < atom->content.sb->size; j++)
                    {
                        unsigned char* firstData = atom->content.sb->fill + j * 4;
                        write_32bit_byte_to_file_from_pointer(file, firstData);
                    }
                }
            }
            byteOffset++;
        }

        fprintf(file, "\n\tData:\n\t\t");

        for (atom = section->first; atom != NULL; atom = atom->next)
        {
            if (atom->type == DATA)
            {

                for (i = 0; i < atom->content.db->size; i++)
                {
                    unsigned char* firstData = atom->content.db->data + i * 4;
                    write_32bit_byte_to_file_from_pointer(file, firstData);
                }
            }
            else if (atom->type == SPACE)
            {
                for (i = 0; i < atom->content.sb->space; i++)
                {
                    for (j = 0; j < atom->content.sb->size; j++)
                    {
                        unsigned char* firstData = atom->content.sb->fill + j * 4;
                        write_32bit_byte_to_file_from_pointer(file, firstData);
                    }
                }
            }
        }
        
        fprintf(file, "\n");
    }
}

/*This function is called for every command line argument that has not been handled yet. 
//Because we do not have any command line arguments, this just returns 0 (== given argument is ignored by parse_args)*/
static int parse_args(char* arg)
{
    return 0;
}

int init_output_hans(char** cp, void (**wo)(FILE*, section*, symbol*), int (**oa)(char*))
{
    *cp = copyright;
    *wo = write_output;
    *oa = parse_args;
    asciiout = 1;
    output_bitsperbyte = 1;  /* we do support BITSPERBYTE != 8 */
    defsecttype = emptystr;  /* default section is "org 0" */
    return 1;
}

#else
int init_output_hans(char** cp, void (**wo)(FILE*, section*, symbol*), int (**oa)(char*))
{
    return 0;
}
#endif
