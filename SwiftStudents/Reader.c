//
//  Reader.c
//  SwiftStudents
//
//  Created by ComarPers 922 on 2017/6/4.
//  Copyright © 2017年 ComarPers 922. All rights reserved.
//

#include "Reader.h"
#include <stdlib.h>

int ReadInt()
{
    int result = 0;
    int isValid = 0;
    char input[100]={'\0'};
    while(!isValid)//验证格式是否合法
    {
        scanf("%s",input);
        for(int i = 0;input[i]!='\0';i++)
        {
            if(input[i]<'0'||input[i]>'9')
            {
                printf("输入无效，请重新输入！\n");
                break;
            }
            if(i == 99||input[i+1]=='\0')
            {
                isValid = 1;
            }
        }
    }
    result = atoi(input);
    return result;
}

float ReadFloat()
{
    double result = 0;
    int isValid = 0;
    char input[100]={'\0'};
    int dotCount = 0;
    while(!isValid)//验证格式是否合法
    {
        scanf("%s",input);
        for(int i = 0;input[i]!='\0';i++)
        {
            if(input[i]!='.')
            {
                if(input[i]<'0' || input[i]>'9')
                {
                    printf("输入无效，请重新输入！\n");
                    break;
                }
            }
            else if(input[i]=='.')
            {
                if(dotCount == 0)
                {
                    dotCount++;
                }
                else
                {
                    printf("输入无效，请重新输入！\n");
                    break;
                }
            }
            if(i == 99||input[i+1]=='\0')
            {
                isValid = 1;
            }
        }
    }
    result = atof(input);
    return result;
}
