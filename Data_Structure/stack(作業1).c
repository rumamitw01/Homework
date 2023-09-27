/*  file name : stack.c     */
/*  使用堆疊處理資料--新增、刪除、輸出 */

#include <stdio.h>
#include <stdlib.h>
#include <stdlib.h>
#define MAX 10
void push_f(void);      /* 新增函數 */
void pop_f(void);       /* 刪除函數 */
void list_f(void);      /* 輸出函數 */
void flushBuffer(void); /* 清空緩衝區 */

char item[MAX][20];
int top = 0;

int main()
{
    char option;
    while (1) {
        printf("\n ************************\n");
        printf("   <1> insert (push)\n");
        printf("   <2> delete (pop)\n");
        printf("   <3> list\n");
        printf("   <4> quit\n");
        printf(" ************************\n");
        printf(" 請輸入選項: ");
        option = getchar();
        flushBuffer();
        
        switch (option) {
            case '1':
                push_f();
                break;
            case '2':
                pop_f();
                break;
            case '3':
                list_f();
                break;
            case '4':
                printf(" 程式結束\n");
                exit(0);
            default:
                printf("\n 選項錯誤!\n 請輸入 1, 2, 3, 或 4\n");
        }
    }

    return 0;
}

void push_f(void)
{
    if (top >= MAX-1)   /* 當堆疊已滿，則顯示錯誤 */
        printf("\n 堆疊是滿的!\n");
    else {
        top++;
        printf("\n 請輸入一字串: ");
        scanf("%s", item[top]);
        flushBuffer();
    }
}

void pop_f(void)
{
    if (top < 1)  /* 當堆疊沒有資料存在，則顯示錯誤 */
        printf("\n 堆疊是空的!\n");
    else {
        printf("\n %s 已被刪除\n", item[top]);
        top--;
    }
}

void list_f(void)
{
    int count = 0, i;
    if (top < 1)
        printf("\n\n 堆疊無資料\n");
    else {
        printf("\n\n  堆疊的資料如下: \n");
        printf(" ------------------\n");
        for (i = top; i >= 1; i--) {
            printf("  %-20s\n", item[i]);
            count++;
        }
        printf(" ------------------\n");
        printf("  共有: %d 字串\n", count);
    }
}

void flushBuffer()
{
    while (getchar() != '\n')
        continue;
}
