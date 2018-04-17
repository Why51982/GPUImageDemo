//
//  ViewController.swift
//  GPUImageDemo
//
//  Created by Ocean on 2018/4/17.
//  Copyright © 2018年 Ocean. All rights reserved.
//

import UIKit
import GPUImage

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    fileprivate lazy var image: UIImage = UIImage(named: "ride")!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = image
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        imageView.image = image
    }

    
    // 褐色(怀旧)
    @IBAction func sepiaButtonClick(_ sender: UIButton) {
        let sepiaFilter = GPUImageSepiaFilter()
        imageView.image = generaterImage(filter: sepiaFilter)
    }
    
    // 素描
    @IBAction func sketchButtonClick(_ sender: UIButton) {
        let sketchFilter = GPUImageSketchFilter()
        imageView.image = generaterImage(filter: sketchFilter)
    }
    
    // 浮雕
    @IBAction func embossButtonClick(_ sender: UIButton) {
        let embossFilter = GPUImageEmbossFilter()
        imageView.image = generaterImage(filter: embossFilter)
    }
    
    // 卡通
    @IBAction func cartoonButtonClick(_ sender: UIButton) {
        let cartoonFilter = GPUImageToonFilter()
        imageView.image = generaterImage(filter: cartoonFilter)
    }
    
    private func generaterImage(filter: GPUImageFilter) -> UIImage {
        
        // 创建图片处理的View
        let processView = GPUImagePicture(image: image)
        
        // 创建滤镜
        processView?.addTarget(filter)
        
        // 处理图片
        filter.useNextFrameForImageCapture()
        processView?.processImage()
        
        // 获取处理过的图片
        return filter.imageFromCurrentFramebuffer()
    }

}

