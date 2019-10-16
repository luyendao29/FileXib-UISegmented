//
//  CustomView.swift
//  FileXib-UISegmented
//
//  Created by Boss on 10/16/19.
//  Copyright © 2019 LuyệnĐào. All rights reserved.
//

import UIKit


var thietBiTableViewCell = "ThietBiTableViewCell"
var chiTietTableViewCell = "ChiTietTableViewCell"
var suCoTableViewCell = "suCoTableViewCell"

class CustomView: UIView {

    @IBOutlet weak var mytableView: UITableView!
    @IBOutlet weak var segmentControll: UISegmentedControl!
    
    
    var chitietbaoduongg = Chitiet()
    var thietbibaoduongg = ThietBi()
    var sucobaoduongg = SuCo()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let _ = loadViewFromNib()
        setupxebCell()
        mytableView.dataSource = chitietbaoduongg
    }
    // setup Xib
    private func setupxebCell(){
         mytableView.register(UINib.init(nibName: chiTietTableViewCell, bundle: nil), forCellReuseIdentifier: chiTietTableViewCell)
        mytableView.register(UINib.init(nibName: thietBiTableViewCell, bundle: nil), forCellReuseIdentifier: thietBiTableViewCell)
        mytableView.register(UINib.init(nibName: suCoTableViewCell, bundle: nil), forCellReuseIdentifier: suCoTableViewCell)
    }
    
    // khoi tao xib
    func loadViewFromNib() -> UIView  {
        let bundle = Bundle.init(for: type(of: self))
        let nib = UINib(nibName: "CustomView", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        view.frame = bounds
        view.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]
        addSubview(view)
        return view
    }
    
    
    
    @IBAction func SegmentControll(_ sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex
        switch index {
        case 0:
            mytableView.dataSource = chitietbaoduongg
            mytableView.reloadData()
        case 1:
            mytableView.dataSource = thietbibaoduongg
            mytableView.reloadData()
    default:
            mytableView.dataSource = sucobaoduongg
            mytableView.reloadData()
             break
        }
       
    }
    
}


    // Class Chi tiet

struct MainTaining {
    var TroubleCode: String
    var TroubleName: String
    var beginTroubleTime: String
    var rootCause: String
    var workArround: String
    var endTroubleTime: String
    var products: String
}
class Chitiet:NSObject,UITableViewDataSource{
    
    var main = [
        MainTaining(TroubleCode: "1", TroubleName: "Sua Hang", beginTroubleTime: "30", rootCause: "40", workArround: "50", endTroubleTime: "het nam", products: "iphoneX"),
        MainTaining(TroubleCode: "2", TroubleName: "Sua Dien", beginTroubleTime: "40", rootCause: "40", workArround: "60", endTroubleTime: "giua nam", products: "iphoneXR")
    ]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return main.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: chiTietTableViewCell, for: indexPath) as! ChiTietTableViewCell
        cell.masucoLabel.text = main[indexPath.row].TroubleCode
        cell.tensucoLabel.text = main[indexPath.row].TroubleName
        cell.ngaysucoLabel.text = main[indexPath.row].beginTroubleTime
        cell.nguyennhanLabel.text = main[indexPath.row].rootCause
        cell.cachkhacphucLabel.text = main[indexPath.row].workArround
        cell.thoigianLabel.text = main[indexPath.row].endTroubleTime
        cell.thietbiLabel.text = main[indexPath.row].products
        
        return cell
        
    }
}


struct ThietBiBaoDuong {
    var tenCr: String
    var soCr: String
    var manodemang: String
    var trangthai: String
    var thoigianstart: String
    var thoigianend: String
}
// Class thiet bi
class ThietBi:NSObject,UITableViewDataSource{
     var thietbi = [ ThietBiBaoDuong(tenCr: "Cuong", soCr: "12", manodemang: "14", trangthai: "tat", thoigianstart: "40", thoigianend: "20/11/2019"),
                     ThietBiBaoDuong(tenCr: "Luyen", soCr: "16", manodemang: "17", trangthai: "tat", thoigianstart: "50", thoigianend: "20/11/2016")
    ]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return thietbi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: thietBiTableViewCell, for: indexPath) as! ThietBiTableViewCell
            cell.tenCR.text = thietbi[indexPath.row].tenCr
            cell.coCRLabel.text = thietbi[indexPath.row].soCr
            cell.manodemangLabel.text = thietbi[indexPath.row].manodemang
            cell.trangthaiLabel.text = thietbi[indexPath.row].trangthai
            cell.batdauLabel.text = thietbi[indexPath.row].thoigianstart
            cell.ketthucLabel.text = thietbi[indexPath.row].thoigianend
        
            return cell
    }
    
    
}

// Class Su Co

struct SuCoBaoDuong {
    var xungYeu: String
    var thoigiantao: String
}
class SuCo:NSObject,UITableViewDataSource{
    
    var suco = [
        SuCoBaoDuong(xungYeu: "50000", thoigiantao: "20/12/1914"),
        SuCoBaoDuong(xungYeu: "800000", thoigiantao: "20/12/2000"),
    ]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return suco.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: suCoTableViewCell, for: indexPath) as! SuCoTableViewCell
        cell.xungyeuLabel.text = suco[indexPath.row].xungYeu
        cell.thoigiantaoLabel.text = suco[indexPath.row].thoigiantao
        return cell
    }
    
    
}
