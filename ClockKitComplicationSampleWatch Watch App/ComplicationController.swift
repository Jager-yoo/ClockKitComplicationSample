//
//  ComplicationController.swift
//  ClockKitComplicationSampleWatch Watch App
//
//  Created by 유재호 on 3/30/24.
//

import ClockKit

final class ComplicationController: NSObject, CLKComplicationDataSource {

  // This method contains important information about your complication.
  func complicationDescriptors() async -> [CLKComplicationDescriptor] {
    [
      CLKComplicationDescriptor(
        identifier: "watch-complication", // This id should be unique and stable.
        displayName: "My Complication",
        supportedFamilies: [.graphicCircular, .graphicCorner])
    ]
  }
  
  // This method is for creating a complication sample. It defines how it will look in Complication Picker Mode.
  func localizableSampleTemplate(for complication: CLKComplication) async -> CLKComplicationTemplate? {
    guard let fullColorImage = UIImage(named: "complication_icon") else { return nil }
    let fullColorImageProvider = CLKFullColorImageProvider(fullColorImage: fullColorImage)

    switch complication.family {
    case .graphicCircular:
      let template = CLKComplicationTemplateGraphicCircularImage(imageProvider: fullColorImageProvider)
      return template

    case .graphicCorner:
      let template = CLKComplicationTemplateGraphicCornerCircularImage(imageProvider: fullColorImageProvider)
      return template

    default:
      return nil
    }
  }

  // This method is for creating an actual live complication.
  func currentTimelineEntry(for complication: CLKComplication) async -> CLKComplicationTimelineEntry? {
    guard
      let fullColorImage = UIImage(named: "complication_icon"),
      let tintColorImage = UIImage(named: "complication_icon_tinted") 
    else { return nil }
    
    let tintColorImageProvider = CLKImageProvider(onePieceImage: tintColorImage)
    let fullColorImageProvider = CLKFullColorImageProvider(fullColorImage: fullColorImage, tintedImageProvider: tintColorImageProvider)

    switch complication.family {
    case .graphicCircular:
      let template = CLKComplicationTemplateGraphicCircularImage(imageProvider: fullColorImageProvider)
      return CLKComplicationTimelineEntry(date: .now, complicationTemplate: template)

    case .graphicCorner:
      let template = CLKComplicationTemplateGraphicCornerCircularImage(imageProvider: fullColorImageProvider)
      return CLKComplicationTimelineEntry(date: .now, complicationTemplate: template)

    default:
      return nil
    }
  }

}
