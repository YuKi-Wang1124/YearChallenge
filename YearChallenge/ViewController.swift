//
//  ViewController.swift
//  YearChallenge
//
//  Created by 王昱淇 on 2021/9/3.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var yearDatePicker: UIDatePicker!
    @IBOutlet weak var yearSlider: UISlider!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var nextYearButton: UIButton!
    @IBOutlet weak var lastYearButton: UIButton!
    
    let imageNames = ["1997","1998","1999","2000","2001","2002","2003","2004","2005","2006","2007","2008","2009","2010","2011","2012","2013","2014","2015","2016","2017","2018","2019","2020","2021",]
    
    let labelArray = ["引爆摩天樓","第十四號獵物","世紀末的魔術師","瞳孔中的暗殺者","往天國的倒數計時","貝克街的亡靈","迷宮的十字路","銀翼的奇術師","水平線上的陰謀","偵探們的鎮魂歌","紺碧之棺","戰慄的樂譜","漆黑的追跡者","天空的遇難船","沉默的15分鐘","第11位前鋒","絕海的偵探","異次元的狙擊手","業火的向日葵","純黑的惡夢","唐紅的戀歌","零的執行人","紺青之拳", "紅之校外旅行","緋色的彈丸"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        addGradientLayer()
        
        view.addSubview(movieNameLabel)
        view.addSubview(imageView)
        view.addSubview(lastYearButton)
        view.addSubview(nextYearButton)
        view.addSubview(yearLabel)
        view.addSubview(yearSlider)
        yearSlider.isContinuous = false
        view.addSubview(yearDatePicker)
        yearDatePicker.frame = CGRect(x: 0, y: 490, width: 414, height: 162)
        yearDatePicker.datePickerMode = .date
        
        imageView.image = UIImage(named: "1997")
    
       
        
    }

    func addGradientLayer() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.red.cgColor,UIColor.white.cgColor,UIColor(red: 161/255, green: 190/255, blue: 234/255, alpha: 1).cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.locations = [0,0.2,0.7]
        gradientLayer.frame = CGRect(x: 0, y: 0, width: 414, height: 896)
        view.layer.addSublayer(gradientLayer)
    }
    
    func changeContents() {
        imageView.image = UIImage(named: imageNames[Int(yearSlider.value)])
        yearLabel.text = Int(yearSlider.value + 1997).description
        movieNameLabel.text = labelArray[Int(yearSlider.value)]
        
    }
    
    @IBAction func yearChange(_ sender: UIDatePicker) {
        let dateComponents = Calendar.current.dateComponents(in: TimeZone.current, from: sender.date)
        var datePickerYear = dateComponents.year!
        // datePicker = 0...24
        datePickerYear = datePickerYear - 1997
        imageView.image = UIImage(named: imageNames[datePickerYear])
        
        yearLabel.text = "\(dateComponents.year!)"
        movieNameLabel.text = labelArray[Int(datePickerYear)]
        // 和 slider 連動
        yearSlider.setValue(yearSlider.value.rounded(), animated: true)
        yearSlider.value = Float(datePickerYear)
        
    }
    
    @IBAction func changeYears(_ sender: UISlider) {
        // sender.value.round() 將 value 四捨五入，讓 slider的圓點滑動到整數的位置，用setValue(_:animated:) 讓圓點以動畫更新位置。
        sender.setValue(sender.value.rounded(), animated: true)
        changeContents()
        
        let newYear = DateComponents(calendar: Calendar.current, year: (Int(sender.value) + 1997), month: 4, day: 19).date
        yearDatePicker.date = newYear!

    }
    
    @IBAction func nextYear(_ sender: Any) {
        
        yearSlider.value += 1
        let newYear = DateComponents(calendar: Calendar.current, year: Int(yearSlider.value) + 1997, month: 4, day: 19).date
        yearDatePicker.date = newYear!
        
        changeContents()
    }
    
    
    @IBAction func lastYear(_ sender: Any) {
        yearSlider.value -= 1
        let newYear = DateComponents(calendar: Calendar.current, year: Int(yearSlider.value) + 1997, month: 4, day: 19).date
        yearDatePicker.date = newYear!
        changeContents()
    }
    
}

