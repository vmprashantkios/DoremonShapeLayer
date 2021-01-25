//
//  ShapeView.swift
//  ShapeLayer
//
//  Created by Prashant on 21/01/21.
//

import UIKit

class ShapeView: UIView {

    
    var circleLayer = CAShapeLayer()
    var  shapePath = UIBezierPath()
    var headYAxis:CGFloat = 0.0
    var colrHeight:CGFloat = 20
    var stomachHeight:CGFloat = 120
    
    override func draw(_ rect: CGRect) {
        
        headYAxis = self.frame.height/2
        drawShape()
    }
    
    
    func drawShape(){
        
        let head = drawHead()
        let rightEye = drawRightEye()
        let leftEye = drawLeftEye()
        let noise = drawNoise()
        let smile = drawSmile()
        let colr = drawColr()
        let stomach = drawStomach()
        let rightHand = drawRightHand()
        let leftHand = drawLeftHand()
        let rightFoot = drawRightFoot()
        let leftFoot = drawLeftFoot()
        let pocket = drawPocket()
        let bell = drawBell()
        
        
        shapePath.append(head)
        shapePath.append(rightEye)
        shapePath.append(leftEye)
        shapePath.append(noise)
        shapePath.append(smile)
        shapePath.append(colr)
        shapePath.append(bell)
        shapePath.append(stomach)
        shapePath.append(rightHand)
        shapePath.append(leftHand)
        shapePath.append(rightFoot)
        shapePath.append(leftFoot)
        shapePath.append(pocket)
        
        
     
        circleLayer.path = shapePath.cgPath
        circleLayer.fillColor = UIColor.white.cgColor
        
        circleLayer.strokeColor = UIColor.black.cgColor
        circleLayer.lineWidth = 2.0
        
        
        self.layer.addSublayer(circleLayer)
        addAnimation()
    }
    
    func drawRightFoot()->UIBezierPath{
        let path = UIBezierPath(roundedRect: CGRect(x: 70, y:  headYAxis+stomachHeight, width: (self.frame.width/2-80), height: 40), cornerRadius: 18)
    
        return path
    }
    
    func drawLeftFoot()->UIBezierPath{
        let path = UIBezierPath(roundedRect: CGRect(x: self.frame.width/2+10, y:  headYAxis+stomachHeight, width: (self.frame.width/2-80), height: 40), cornerRadius: 18)
        
        return path
    }
    
    
    func drawPocket()->UIBezierPath{
        
        let centerWidth = (self.frame.width - 200)/2
        let outerShape = UIBezierPath()
        outerShape.addArc(withCenter: CGPoint(x: 100+centerWidth, y: headYAxis+colrHeight+10), radius: centerWidth+10, startAngle: deg2rad(-10), endAngle: deg2rad(190), clockwise: true)
        
        let path = UIBezierPath()
        
        path.move(to: CGPoint(x: 120, y: headYAxis+colrHeight+30))
        path.addLine(to: CGPoint(x: self.frame.width-120, y: headYAxis+colrHeight+30))
        
        
        
        path.addArc(withCenter: CGPoint(x: 120+(self.frame.width - 240)/2, y: headYAxis+colrHeight+30), radius: (self.frame.width - 240)/2, startAngle: deg2rad(0), endAngle: deg2rad(180), clockwise: true)
        
        outerShape.append(path)
        return outerShape
    }
    
    func drawStomach1()->UIBezierPath{
        
    
        
        let path = UIBezierPath()
        
        path.move(to: CGPoint(x: 80, y: headYAxis+colrHeight))
        path.addLine(to: CGPoint(x: 80, y: headYAxis+stomachHeight))
//        path.addLine(to: CGPoint(x: self.frame.width-80, y: headYAxis+stomachHeight))
//        path.addLine(to: CGPoint(x: self.frame.width-80, y: headYAxis+colrHeight))
        path.addLine(to: CGPoint(x: self.frame.width/2-20, y: headYAxis+stomachHeight))
        path.addArc(withCenter: CGPoint(x: self.frame.width/2, y: headYAxis+stomachHeight), radius: 20, startAngle: deg2rad(180), endAngle: deg2rad(360), clockwise: true)
        path.addLine(to: CGPoint(x: self.frame.width-80, y: headYAxis+stomachHeight))
        path.addLine(to: CGPoint(x: self.frame.width-80, y: headYAxis+colrHeight))
        
        return path
        
    }
    
    
    func drawStomach()->UIBezierPath{
        
    
        
        let path = UIBezierPath()
        
        path.move(to: CGPoint(x: 80, y: headYAxis+colrHeight))
        path.addQuadCurve(to: CGPoint(x: 80, y: headYAxis+stomachHeight), controlPoint: CGPoint(x: 70, y: headYAxis+stomachHeight/2))
     //   path.addLine(to: CGPoint(x: 80, y: headYAxis+stomachHeight))
//        path.addLine(to: CGPoint(x: self.frame.width-80, y: headYAxis+stomachHeight))
//        path.addLine(to: CGPoint(x: self.frame.width-80, y: headYAxis+colrHeight))
        path.addLine(to: CGPoint(x: self.frame.width/2-20, y: headYAxis+stomachHeight))
        path.addArc(withCenter: CGPoint(x: self.frame.width/2, y: headYAxis+stomachHeight), radius: 20, startAngle: deg2rad(180), endAngle: deg2rad(360), clockwise: true)
        path.addLine(to: CGPoint(x: self.frame.width-80, y: headYAxis+stomachHeight))
       // path.addLine(to: CGPoint(x: self.frame.width-80, y: headYAxis+colrHeight))
        path.addQuadCurve(to: CGPoint(x: self.frame.width-80, y: headYAxis+colrHeight), controlPoint: CGPoint(x: self.frame.width-70, y: headYAxis+stomachHeight/2))
        
        return path
        
    }
    
    func drawHandCircle(center:CGPoint)->UIBezierPath{
        
        let path = UIBezierPath()
        path.addArc(withCenter: center, radius: 20, startAngle: deg2rad(0), endAngle: deg2rad(360), clockwise: true)
        
       return path
    }
    
    func drawRightHand()->UIBezierPath{
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 60, y: headYAxis+10))
        path.addLine(to: CGPoint(x: 80, y: headYAxis+colrHeight))
        path.addQuadCurve(to: CGPoint(x: 75, y: headYAxis+colrHeight+30), controlPoint: CGPoint(x: 75, y: headYAxis+colrHeight+15))
       // path.addLine(to: CGPoint(x: 80, y: headYAxis+colrHeight+30))
        path.addLine(to: CGPoint(x: 55, y: headYAxis+25))
        
        let circle = drawHandCircle(center: CGPoint(x: 40, y: headYAxis+10))
        path.append(circle)
        
        return path
    }
    
    func drawLeftHand()->UIBezierPath{
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: self.frame.width-60 , y: headYAxis+10))
        path.addLine(to: CGPoint(x: self.frame.width-80, y: headYAxis+colrHeight))
        path.addQuadCurve(to: CGPoint(x: self.frame.width-75, y: headYAxis+colrHeight+30), controlPoint: CGPoint(x: self.frame.width-75, y: headYAxis+colrHeight+15))
       // path.addLine(to: CGPoint(x: self.frame.width-80, y: headYAxis+colrHeight+30))
        path.addLine(to: CGPoint(x: self.frame.width-55, y: headYAxis+25))
        
        let circle = drawHandCircle(center: CGPoint(x: self.frame.width-40, y: headYAxis+10))
        path.append(circle)
        
        return path
    }
    
    func drawhead1()->UIBezierPath{
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 80, y: headYAxis))
      //  path.addQuadCurve(to: CGPoint(x: self.frame.width/2-20, y: headYAxis-100), controlPoint: CGPoint(x: self.frame.width/4, y: headYAxis-90))
        path.addCurve(to: CGPoint(x: self.frame.width/2-30, y: headYAxis-110), controlPoint1: CGPoint(x: self.frame.width*0.15, y: headYAxis-90), controlPoint2: CGPoint(x: self.frame.width/2-30, y: headYAxis-110))
        
        return path
    }
    
    func drawhead2()->UIBezierPath{
        
        let path = UIBezierPath()
       // path.move(to: CGPoint(x: self.frame.width-80, y: headYAxis))
        path.move(to: CGPoint(x: self.frame.width/2+30, y: headYAxis-110))
      //  path.addQuadCurve(to: CGPoint(x: self.frame.width/2-20, y: headYAxis-100), controlPoint: CGPoint(x: self.frame.width/4, y: headYAxis-90))
        path.addCurve(to: CGPoint(x: self.frame.width-80, y: headYAxis), controlPoint1: CGPoint(x: self.frame.width*0.85, y: headYAxis-90), controlPoint2: CGPoint(x: self.frame.width-80, y: headYAxis))
        
        return path
    }
    
    func drawHead()->UIBezierPath{
        
        let path = UIBezierPath()

      //  path.move(to: CGPoint(x: 80, y: headYAxis))
        path.addArc(withCenter: CGPoint(x: (self.frame.width/2), y: headYAxis-55), radius: 90, startAngle: deg2rad(140), endAngle: deg2rad(400), clockwise: true)
        //path.addLine(to: CGPoint(x: 80, y: headYAxis))
       // path.addCurve(to: CGPoint(x: self.frame.width-80, y: headYAxis), controlPoint1: CGPoint(x: 0, y: 0), controlPoint2: CGPoint(x: self.frame.width, y: 0))
        
        let sideRight = UIBezierPath()
        sideRight.move(to: CGPoint(x: 80, y: headYAxis))
      //  path.addQuadCurve(to: CGPoint(x: self.frame.width/2-20, y: headYAxis-100), controlPoint: CGPoint(x: self.frame.width/4, y: headYAxis-90))
        sideRight.addCurve(to: CGPoint(x: self.frame.width/2-30, y: headYAxis-110), controlPoint1: CGPoint(x: self.frame.width*0.15, y: headYAxis-90), controlPoint2: CGPoint(x: self.frame.width/2-30, y: headYAxis-110))
        path.append(sideRight)
        
        let sideLeft = UIBezierPath()
       // path.move(to: CGPoint(x: self.frame.width-80, y: headYAxis))
        sideLeft.move(to: CGPoint(x: self.frame.width/2+30, y: headYAxis-110))
      //  path.addQuadCurve(to: CGPoint(x: self.frame.width/2-20, y: headYAxis-100), controlPoint: CGPoint(x: self.frame.width/4, y: headYAxis-90))
        sideLeft.addCurve(to: CGPoint(x: self.frame.width-80, y: headYAxis), controlPoint1: CGPoint(x: self.frame.width*0.85, y: headYAxis-90), controlPoint2: CGPoint(x: self.frame.width-80, y: headYAxis))
        path.append(sideLeft)
        
       
        return path
    }
    
    func drawRightEye()->UIBezierPath{
        
        //let path = UIBezierPath(roundedRect: CGRect(x: self.frame.width/2-30, y: headYAxis-130, width: 30, height: 40), cornerRadius: 40)
        let path = UIBezierPath(ovalIn: CGRect(x: self.frame.width/2-30, y: headYAxis-130, width: 30, height: 40))
        
        let dot = UIBezierPath(roundedRect: CGRect(x: self.frame.width/2-15, y:  headYAxis-110, width: 10, height: 10), cornerRadius: 5)
        path.append(dot)
        return path
    }
    
    func drawLeftEye()->UIBezierPath{
        
        //let path = UIBezierPath(roundedRect: CGRect(x: self.frame.width/2-30, y: headYAxis-130, width: 30, height: 40), cornerRadius: 40)
        let path = UIBezierPath(ovalIn: CGRect(x: self.frame.width/2, y: headYAxis-130, width: 30, height: 40))
        let dot = UIBezierPath(roundedRect: CGRect(x: self.frame.width/2+5, y:  headYAxis-110, width: 10, height: 10), cornerRadius: 5)
        path.append(dot)
        return path
    }
    
    func drawSmile()->UIBezierPath{
        
        let path = UIBezierPath(arcCenter: CGPoint(x: self.frame.width/2, y: headYAxis-65) , radius: 50, startAngle: deg2rad(30), endAngle: deg2rad(150), clockwise: true)
        
        
        return path
    }
    
    func drawLine(point1:CGPoint,point2:CGPoint)->UIBezierPath{
        
        let path = UIBezierPath()
        path.move(to: point1)
        path.addLine(to:point2)
        return path
        
    }
    
    func drawNoise()->UIBezierPath{
        
        let path = UIBezierPath(arcCenter: CGPoint(x: self.frame.width/2, y: headYAxis-85), radius: 10, startAngle: deg2rad(0), endAngle: deg2rad(360), clockwise: true)
        
        let noseLine = drawLine(point1: CGPoint(x: self.frame.width/2, y: headYAxis-70), point2: CGPoint(x: self.frame.width/2, y: headYAxis-40))
        path.append(noseLine)
        
        let line1 = drawLine(point1: CGPoint(x: self.frame.width/2-50, y: headYAxis-70), point2: CGPoint(x: self.frame.width/2-10, y: headYAxis-60))
        path.append(line1)
        
        let line2 = drawLine(point1: CGPoint(x: self.frame.width/2+50, y: headYAxis-70), point2: CGPoint(x: self.frame.width/2+10, y: headYAxis-60))
        path.append(line2)
        
        
        let line3 = drawLine(point1: CGPoint(x: self.frame.width/2-65, y: headYAxis-55), point2: CGPoint(x: self.frame.width/2-15, y: headYAxis-55))
        path.append(line3)
        
        let line4 = drawLine(point1: CGPoint(x: self.frame.width/2+65, y: headYAxis-55), point2: CGPoint(x: self.frame.width/2+15, y: headYAxis-55))
        path.append(line4)
        
        let line5 = drawLine(point1: CGPoint(x: self.frame.width/2-50, y: headYAxis-45), point2: CGPoint(x: self.frame.width/2-10, y: headYAxis-50))
        path.append(line5)
        
        let line6 = drawLine(point1: CGPoint(x: self.frame.width/2+50, y: headYAxis-40), point2: CGPoint(x: self.frame.width/2+10, y: headYAxis-50))
        path.append(line6)
        
        
        return path
    }
    
    func drawColr()->UIBezierPath{
        
        let path = UIBezierPath(roundedRect: CGRect(x: 80, y: headYAxis, width: self.frame.width-160, height: colrHeight), cornerRadius: 0)
//        path.move(to: CGPoint(x: 80, y: headYAxis))
//        path.addLine(to: CGPoint(x: self.frame.width-80, y:headYAxis))
//        path.addLine(to: CGPoint(x: self.frame.width-80, y: headYAxis+colrHeight))
//        path.addLine(to: CGPoint(x: 80, y: headYAxis+colrHeight))
//        path.addLine(to: CGPoint(x: 80, y: headYAxis))
        
        return path

    }
    
    func drawBell()->UIBezierPath{
        
        let path = UIBezierPath()
        path.addArc(withCenter: CGPoint(x: self.frame.width/2, y: headYAxis+colrHeight+12), radius: 12, startAngle: deg2rad(0), endAngle: deg2rad(360), clockwise: true)
        
        
        let path1 = UIBezierPath()
        path1.move(to: CGPoint(x: self.frame.width/2-12, y: headYAxis+colrHeight+12))
        path1.addQuadCurve(to: CGPoint(x: self.frame.width/2+12, y: headYAxis+colrHeight+12), controlPoint: CGPoint(x: self.frame.width/2, y: headYAxis+colrHeight+13))
        
        path.append(path1)
     
        
        return path
    }
    
    func addAnimation(){
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = 6
      //  animation.autoreverses = true
      //  animation.repeatCount = .infinity
        circleLayer.add(animation, forKey: "line")
    }
    

    func deg2rad(_ number: Double) -> CGFloat {
        return CGFloat(number * .pi / 180)
    }
    
    
    
    

}
