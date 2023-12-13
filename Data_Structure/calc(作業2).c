#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#define MAX 30

void infix_to_postfix(char [], int);  /* 由中序轉後序函數 */
int compare(char, char); /* 比較兩個運算子函數 */

/* 在中序表示法佇列及暫存堆疊中，運算子的優先順序表，其優先值為INDEX/2 */
char infix_priority[9] = {'#', ')', '+', '-', '*', '/', '^', '('};
char stack_priority[8] = {'#', '(', '+', '-', '*', '/', '^'};
char opr[5] = {'+', '-', '*', '/', '^'};

// 定義節點結構
struct Node {
    char data;
    struct Node* next;
};

struct Node* head = NULL;
struct Node* createNode(char data);
void insertNode(struct Node** head, char data);
void printList(struct Node* head);

// 初始化一個新節點
struct Node* createNode(char data) {
    struct Node* newNode = (struct Node*)malloc(sizeof(struct Node));
    newNode->data = data;
    newNode->next = NULL;
    return newNode;
}

// 插入新節點到鍊結串列尾端
void insertNode(struct Node** head, char data) {
    struct Node* newNode = createNode(data);
    if (*head == NULL) {
        *head = newNode;
    } else {
        struct Node* temp = *head;
        while (temp->next != NULL) {
            temp = temp->next;
        }
        temp->next = newNode;
    }
}

// 顯示鍊結串列內容
void printList(struct Node* head) {
    struct Node* temp = head;
    int i=1;
    while (temp != NULL) {
        printf("[%d]%c ",i, temp->data);
        temp = temp->next;
        i++;
    }
    printf("\n");
}


int main() {
    int index = -1;
    char infix_q[MAX];  /* 儲存使用者輸入中序式的佇列 */
    printf("*********************************\n");
    printf("      -- Usable operator --\n");
    printf(" ^: Exponentiation\n");
    printf(" *: Multiply      /: Divide\n");
    printf(" +: Add           -: Subtraction\n");
    printf(" (: Left Brace    ): Right Brace\n");
    printf("*********************************\n");
    
    printf("請輸入中序表示式(僅支援單位數): ");
    while (infix_q[index] != '\n')
        infix_q[++index] = getchar();
    infix_q[index] = '#';  /* 結束時加入 # 為結束符號 */
    
    infix_to_postfix(infix_q, index);

    // 列印串列內容
    printf("後序表達式存入鏈結串列後的樣子:");
    printList(head);
    printf("計算結果:我做不出來\n");
}
void infix_to_postfix(char infix_q[], int index)
{
    int top = 0, ctr, tag = 1 ;
    char stack_t[MAX];  /* 用以儲存還不必輸出的運算子 */
    stack_t[top] = '#'; /* 於堆疊最底下加入#為結束符號 */
    for (ctr = 0; ctr <= index; ctr++) {
        switch (infix_q[ctr]) {
            /* 輸入為 )，則輸出堆疊內運算子，直到堆疊內為 ( */
            case ')':
                while (stack_t[top] != '(')
                    insertNode(&head, stack_t[top--]);
                top--;
                break;
            /* 輸入為 #，則將堆疊內還未輸出的運算子輸出 */
            case '#':
                while (stack_t[top] != '#')
                    insertNode(&head, stack_t[top--]);
                break;
            /* 輸入為運算子，若小於TOP在堆疊中所指運算子，則將堆疊
                的運算子輸出，直到堆疊內的運算子小於輸入的運算子，
                若大於等於TOP在堆疊中所指運算子，則
                將輸入之運算子置入堆疊 */

            case '(':
            case '^':
            case '*':
            case '/':
                while (compare(stack_t[top], infix_q[ctr]))
                    insertNode(&head, stack_t[top--]);
                stack_t[++top] = infix_q[ctr];
                tag = 1;
                break;
            case '+':
            case '-':
                if (tag == 1) { /* 判斷 (，^，*，/ 後的 - 號是否表示負的 */
                    stack_t[++top] = infix_q[ctr];
                    tag = 2;  /* 將 tag 設為 2 */
                }
                else {
                    while (compare(stack_t[top], infix_q[ctr]))
                        insertNode(&head, stack_t[top--]);
                    stack_t[++top] = infix_q[ctr];
                    tag = 1;
                }
                break;
            /* 輸入為運算元，則直接輸出 */
            default:
                insertNode(&head, infix_q[ctr]);
                if (tag == 2) /* 將存放在堆疊的負號輸出 */
                    insertNode(&head, stack_t[top--]);
                tag = 0;
                break;
        }
    }
}

/* 比較兩運算子優先權，若輸入運算子小於堆疊中運算子，則傳回值為 1，否則為 0 */
int compare(char stack_o, char infix_o)
{
    int index_s = 0, index_i = 0;
    while (stack_priority[index_s] != stack_o)
        index_s++;
    while (infix_priority[index_i] != infix_o)
        index_i++;
    return index_s/2 >= index_i/2 ? 1 : 0;
}
