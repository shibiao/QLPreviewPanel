//
//  ViewController.swift
//  QLPreviewPanel
//
//  Created by sycf_ios on 2017/11/17.
//  Copyright © 2017年 sycf_ios. All rights reserved.
//

import Cocoa
import Quartz
class ViewController: NSViewController, QLPreviewPanelDelegate, QLPreviewPanelDataSource {
    var sharedPanel: QLPreviewPanel!
    func numberOfPreviewItems(in panel: QLPreviewPanel!) -> Int {
        return 1
    }
    
    func previewPanel(_ panel: QLPreviewPanel!, previewItemAt index: Int) -> QLPreviewItem! {
        
        if let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("1.jpg") {
            print("___\(path)")
            return path as QLPreviewItem
        }
        
        return nil
    }
    
    override func acceptsPreviewPanelControl(_ panel: QLPreviewPanel!) -> Bool {
        return true
    }
    override func beginPreviewPanelControl(_ panel: QLPreviewPanel!) {
        sharedPanel = panel
        
    }
    override func endPreviewPanelControl(_ panel: QLPreviewPanel!) {
        sharedPanel = nil
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        sharedPanel = QLPreviewPanel.shared()
        
        
//        sharedPanel.contentView?.wantsLayer = true
//        sharedPanel.contentView?.layer?.backgroundColor = NSColor.red.cgColor
        
        // Do any additional setup after loading the view.
    }
    @IBAction func handleTap(_ sender: Any) {
        
        sharedPanel.delegate = self
        sharedPanel.dataSource = self
        sharedPanel.makeKeyAndOrderFront(self)
        sharedPanel.center()

    }
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

