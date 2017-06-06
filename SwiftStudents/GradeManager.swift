//
//  GradeManager.swift
//  SwiftStudents
//
//  Created by ComarPers 922 on 2017/6/4.
//  Copyright © 2017年 ComarPers 922. All rights reserved.
//

import Foundation

class GradeManager
{
    static var ReadyToExit = false//程序是否准备结束
    
    static var Grades:[Float] = []//储存所有分数
    static func displayMenu()
    {
        print("***********************************")
        print("1--初始化数学成绩")
        print("2--求成绩的平均值")
        print("3--统计成绩大于85分的人数")
        print("4--修改指定位置处的成绩")
        print("5--打印输出所有成绩")
        print("0--退出")
        print("***********************************")
        print("请输入对应的数字进行操作")
        let operation = ReadInt()
        
        switch operation
        {
        case 1:
            Grades = initScore()
        case 2:
            print("数学平均成绩为：\(average(Grades))")
        case 3:
            print("成绩大于85分的人数为：\(count(Grades))")
        case 4:
            print("请输入要修改数据处位置：")
            let index = ReadInt()
            print("请输入新数据：")
            let newScore = ReadFloat()
            if(update(f:&Grades,index: Int(index), newScore: newScore))
            {
                print("修改后的成绩为：")
                displayAllScore(f: Grades)
            }
        case 5:
            displayAllScore(f: Grades)
        case 0:
            print("程序退出")
            ReadyToExit = true
        default:
            print("无效的操作数，请重新输入！")
        }
    }
    //初始化分数
    static func initScore() ->[Float]
    {
        print("请输入要储存数学成绩的数量：")
        let num = ReadInt()
        var result:[Float] = []
        for index in 0..<num
        {
            print("请输入第\(index + 1)个数据：")
            result.append(ReadFloat())
        }
        return result
    }
    //求平均分
    static func average(_ scores:[Float])->Float
    {
        var result:Float = 0
        for item in scores
        {
            result += item
        }
        return result/Float(scores.count)
    }
    //统计成绩大于（>）85分的数量
    static func count( _ arr:[Float])->Int
    {
        var result = 0
        for item in arr
        {
            if(item > 85)
            {
                result += 1
            }
        }
        return result
    }
    //修改指定位置处成绩
    static func update(f:inout [Float], index:Int,newScore:Float) -> Bool
    {
        if(index >= f.count)
        {
            print("超出索引范围，无法更改！")
            return false
        }
        else
        {
            f[index] = newScore
            return true
        }
    }
    //打印所有分数
    static func displayAllScore( f:[Float])
    {
        var ScoreString = ""
        for item in f
        {
            ScoreString.append("\(item) ")
        }
        print(ScoreString)
    }
}
