//
//  calendarioView.swift
//  Scheduler
//
//  Created by Felipe Marques Ramos on 08/06/15.
//  Copyright (c) 2015 Mariana Medeiro. All rights reserved.
//

import UIKit
import Foundation

class calendarioView: UIView, UIGestureRecognizerDelegate{
    
    //buttons
    
    @IBOutlet weak var domBut: UIButton!
    @IBOutlet weak var segBut: UIButton!
    @IBOutlet weak var TerBut: UIButton!
    @IBOutlet weak var QuaBut: UIButton!
    @IBOutlet weak var sabBut: UIButton!
    @IBOutlet weak var sexBut: UIButton!
    @IBOutlet weak var Qui: UIButton!
    
    @IBOutlet weak var selectedDayLabel: UILabel!
    
    var today = NSDate()
    var weekSunday: NSDate?
    var selectedDay = NSDate()
    var calendar = NSCalendar()
    
    
    func voltar(){}
    func proximo(){}
    func calendarioView(){
        //setando o formato desejado para a string do dia
        var format = NSDateFormatter()
        format.dateStyle = NSDateFormatterStyle.LongStyle
        
        var weekArray = [domBut,segBut,TerBut,QuaBut,sabBut,sexBut,Qui]// seta array de week buttons
        
        selectedDayLabel.text = "\(format.stringFromDate(today))"
    
        for botao in weekArray{
            botao.addTarget(self, action: "selecDay", forControlEvents: UIControlEvents.TouchDown)
        }
        
        
        //swypeLeft proximo
        var recognizerLeft = UISwipeGestureRecognizer(target: self, action: "swypeLeft")
        recognizerLeft.delegate=self;
        recognizerLeft.direction = UISwipeGestureRecognizerDirection.Left
        self.addGestureRecognizer(recognizerLeft)
        
        
        
        //swypeRight volta
        var recognizerRight = UISwipeGestureRecognizer(target: self, action: "swypeRight")
        recognizerRight.delegate=self;
        recognizerRight.direction = UISwipeGestureRecognizerDirection.Right
        self.addGestureRecognizer(recognizerRight)
        
        
        //pegando o primeiro dia da semana(weekSunday)
        var weekDayComp = calendar.components(NSCalendarUnit.CalendarUnitWeekday, fromDate: today)
        var daysToSbustract = NSDateComponents()
        daysToSbustract.day = 0 - (weekDayComp.weekday - 1)
        weekSunday = calendar.dateByAddingComponents(daysToSbustract, toDate: today, options: NSCalendarOptions.allZeros)
//        [self updateDay:0];
    }
    
    func swypeLeft(){
        selectedDayLabel.text = "esquerda"
    }
    func swypeRight(){
        selectedDayLabel.text = "direita"
    }
}
