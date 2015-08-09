//
//  ViewController.swift
//  ChromaDemo
//
//  Created by iChrille on 8/9/15.
//  Copyright (c) 2015 Reversebox. All rights reserved.
//

import UIKit
import Chroma

class ViewController: UITableViewController {

  var baseColor: UIColor
  var endColor: UIColor

  var tintsGenerator: ColorTint
  let rows: Int = 14

  required init!(coder aDecoder: NSCoder!) {
    baseColor = UIColor(hue: 260.0/360.0, saturation: 82.0/100.0, brightness: 58.0/100.0, alpha: 1.0)
    endColor = UIColor(hue: 56.0/360.0, saturation: 89.0/100.0, brightness: 97.0/100.0, alpha: 1.0)
    tintsGenerator = ColorTint(baseColor: baseColor, amount: rows)

    super.init(coder: aDecoder)
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    var sh: CGFloat = 0
    var ss: CGFloat = 0
    var sl: CGFloat = 0
    baseColor.getHue(&sh, saturation: &ss, brightness: &sl, alpha: nil)

    var eh: CGFloat = 0
    var es: CGFloat = 0
    var el: CGFloat = 0
    endColor.getHue(&eh, saturation: &es, brightness: &el, alpha: nil)

    func matte(from: Double, to: Double, between: Double, factor: Double) -> Double {
      return (from / to) / between * factor
    }

    tintsGenerator.amount = rows
    tintsGenerator.hueStep = CGFloat(matte(Double(sh), Double(eh), Double(rows), 4));
    tintsGenerator.saturationStep = CGFloat(matte(Double(ss), Double(es), Double(rows), 10));
    tintsGenerator.lightnessStep = CGFloat(matte(Double(sl), Double(el), Double(rows), 10));
    tintsGenerator.maxColorSpan = CGFloat(rows);
  }

  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return rows
  }

  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! UITableViewCell
    cell.backgroundColor = tintsGenerator.tintAtIndex(indexPath.row)
    cell.selectedBackgroundView = UIView()
    return cell
  }

  override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    return 140
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

}

