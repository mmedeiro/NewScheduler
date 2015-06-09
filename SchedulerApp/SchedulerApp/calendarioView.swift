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
    @IBOutlet weak var weekView: UIView!
    
    var today = NSDate()
    var weekSunday = NSDate()
    var selectedDay = NSDate()
    var calendar = NSCalendar.currentCalendar()
    var weekArray = Array<UIButton!>()
    
    func calendarioView(){
        //setando o formato desejado para a string do dia
        var format = NSDateFormatter()
        format.dateStyle = NSDateFormatterStyle.LongStyle
        
        weekArray = [domBut,segBut,TerBut,QuaBut,sabBut,sexBut,Qui]// seta array de week buttons
        
        selectedDayLabel.text = "\(format.stringFromDate(today))"
        
        for botao in weekArray{
            botao.addTarget(self, action: "selectDay:", forControlEvents: UIControlEvents.TouchDown)
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
        var aux = calendar.dateByAddingComponents(daysToSbustract, toDate: today, options: NSCalendarOptions(0))
        weekSunday = aux!
        self.updateDay(0)
    }
    
    //MARK: Updates
    func updateDay(sinal:Int){
        self.updateWeek(sinal)
        var sundayComp = calendar.components((NSCalendarUnit.CalendarUnitDay|NSCalendarUnit.CalendarUnitMonth|NSCalendarUnit.CalendarUnitYear), fromDate: weekSunday)
        
        var soDia = NSDateFormatter()
        soDia.dateFormat = "dd"
        
        var diaInt = NSDateFormatter()
        diaInt.dateFormat = "dd/MM/YYYY"
        
        var newComp = NSDateComponents()
        newComp.day = sundayComp.day
        
        for botao in weekArray{
            
            newComp.month = sundayComp.month
            newComp.year = sundayComp.year
            
            var newDate = calendar.dateFromComponents(newComp)
            botao.layer.cornerRadius = 15
            
            var dif = newComp.day - sundayComp.day
            botao.tag = dif
            
            botao.setTitle(soDia.stringFromDate(newDate!), forState: UIControlState.Normal)
            botao.tintColor = UIColor.blackColor()
            
            var diaTest = calendar.dateFromComponents(newComp)
            if diaInt.stringFromDate(diaTest!) == diaInt.stringFromDate(today){
                botao.backgroundColor = UIColor(red: 0.15, green: 0.48, blue: 0.8, alpha: 1)
            }
            else{
                botao.backgroundColor = nil
                botao.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), forState: UIControlState.Normal)
            }
            
            newComp.day = newComp.day + 1
            newComp.month = sundayComp.month
            newComp.year = sundayComp.year
        }
        
    }
    func updateWeek(sinal:Int){
        var sundayComp = calendar.components((NSCalendarUnit.CalendarUnitDay|NSCalendarUnit.CalendarUnitMonth|NSCalendarUnit.CalendarUnitYear), fromDate: weekSunday)
        sundayComp.day = sundayComp.day + (7 * sinal)
        weekSunday = calendar.dateFromComponents(sundayComp)!
    }
    
    //MARK: Actions
    func selectDay(sender:UIButton){
        self.updateDay(0)
        
        //muda cor do botao
        sender.setTitleColor(UIColor(red: 0.3, green: 0.63, blue: 0.98, alpha: 1), forState: UIControlState.Normal)
        sender.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        
        var format = NSDateFormatter()
        format.dateStyle = NSDateFormatterStyle.LongStyle
        
        var diaSelecComp = NSDateComponents()
        var sundayComp = calendar.components((NSCalendarUnit.CalendarUnitDay|NSCalendarUnit.CalendarUnitMonth|NSCalendarUnit.CalendarUnitYear), fromDate: weekSunday)
        diaSelecComp.day = sundayComp.day + sender.tag
        
        diaSelecComp.month = sundayComp.month
        diaSelecComp.year = sundayComp.year
        
        var diaSelec = calendar.dateFromComponents(diaSelecComp)
        
        selectedDay = diaSelec!
        selectedDayLabel.text = format.stringFromDate(diaSelec!)

        selectedDay = calendar.dateFromComponents(diaSelecComp)!

    }
    func voltar(){
        self.updateDay(-1)
        self.animationUpdateEnd(1)
    }
    func proximo(){
        self.updateDay(1)
        self.animationUpdateEnd(-1)
    }
    
    //MARK: Gestures
    func swypeLeft(){
        self.myAnimation(kCATransitionFromRight)
        self.proximo()
    }
    func swypeRight(){
        self.myAnimation(kCATransitionFromLeft)
        self.voltar()
    }
    
    //MARK: Animations
    func myAnimation(subType: String){
        var animation =  CATransition()
        animation.delegate = self
        animation.type = kCATransitionPush
        animation.subtype = subType
        animation.duration = 0.5
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        weekView.layer.addAnimation(animation, forKey: kCATransition)
        self.updateDay(0)
    }
    func animationUpdateEnd(sinal:Int){
        for botao in weekArray{
            botao.transform = CGAffineTransformMakeTranslation(CGFloat(400 * sinal), 0)
        }
        UIView.animateWithDuration(0.2, animations: { () -> Void in
            for botao in self.weekArray{
                botao.transform = CGAffineTransformMakeTranslation(0, 0)
            }
        })
    }
//    -(void)myAnimation:(NSString *)subType{// faz uma bela animação
//    CATransition *animation =[CATransition animation];
//    [animation setDelegate:self];
//    [animation setType:kCATransitionPush];
//    [animation setSubtype:subType];
//    [animation setDuration:.5];
//    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
//    [weekView.layer addAnimation:animation forKey:kCATransition];
//    [self updateDay:0];
//    }
//    
//    -(void)animationUpdateEnd:(int)sinal{//termina a bela animação
//    for (UIButton *botao in weekArray) {
//    [botao setTransform:CGAffineTransformMakeTranslation((400*sinal), 0)];
//    }
//    [UIView animateWithDuration:.2 animations:^{
//    for (UIButton *botao in weekArray) {
//    [botao setTransform:CGAffineTransformMakeTranslation(0, 0)];
//    }
//    }];
//    }
}
