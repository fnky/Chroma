//
//  ColorTint.swift
//  Chroma
//
//  Created by Christian Petersen on 8/9/15.
//  Copyright (c) 2015 Reversebox. All rights reserved.
//

import Foundation
import UIKit

/**
 *  Represents a `ColorTint` generator
 */
public struct ColorTint {

  /// The color to start from
  public var startColor: UIColor!

  /// The color to end at
  public var endColor: UIColor?

  /// The amount of steps of hue to take
  public var hueStep: CGFloat = -2.5

  /// The amount of steps for saturation to take
  public var saturationStep: CGFloat = 1

  /// The amount of steps for brightness to take
  public var lightnessStep: CGFloat = 2.5

  /// The overall span across colors
  public var maxColorSpan: CGFloat = 5

  /// The amount of colors to generate
  public var amount: Int!

  private var spanH: CGFloat
  private var spanS: CGFloat
  private var spanL: CGFloat

  /**
   Initialize a new generator

   :param: startColor The color to start with
   :param: endColor   The color to end at

   :returns: A new `ColorTint` generator
   */
  public init(startColor: UIColor!, endColor: UIColor?) {
    self.startColor = startColor
    self.endColor = endColor

    spanH = maxColorSpan * hueStep;
    spanS = maxColorSpan * saturationStep;
    spanL = maxColorSpan * lightnessStep;
  }

  /**
   Initialize a new generator

   :param: baseColor The base color to generate from

   :returns: A new `ColorTint` generator
   */
  public init(baseColor: UIColor!) {
    self.init(startColor: baseColor, endColor: nil)
  }

  /**
   Generates a new color at the `order` based on `amount`

   :param: order The order to generate

   :returns: A `UIColor` of the generated color
   */
  public func tintAtIndex(index: Int) -> UIColor? {
    let i = CGFloat(index)
    let n = CGFloat(amount)

    var sH = hueStep;
    var sS = saturationStep;
    var sL = lightnessStep;

    // If we have more than the maximum span of colors, we divide the given
    // spans by the current amount.
    if n > maxColorSpan {
      sH = spanH / n;
      sS = spanS / n;
      sL = spanL / n;
    }

    // Convert the values to float points
    sH /= 360
    sS /= 100
    sL /= 100

    var hue: CGFloat = 0
    var saturation: CGFloat = 0
    var brightness: CGFloat = 0
    var alpha: CGFloat = 0
    startColor.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)

    var h: CGFloat = hue + i * sH
    h = min(max(h, 0), 360)

    return UIColor(
      hue: h + i * sH,
      saturation: min(1.0, saturation + i * sS),
      brightness: min(1.0, brightness + i * sL),
      alpha: alpha
    )
  }

}
