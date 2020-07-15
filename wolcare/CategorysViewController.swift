//
//  CategorysViewController.swift
//  wolcare
//
//  Created by DENNOUN Mohamed on 15/07/2020.
//  Copyright © 2020 Mohamed dennoun. All rights reserved.
//

//
//  CategorysViewController.swift
//  wolcare
//
//  Created by DENNOUN Mohamed on 15/07/2020.
//  Copyright © 2020 Mohamed dennoun. All rights reserved.
//

import UIKit
import Foundation

class CategorysViewController: UIViewController {

lazy var backdropView: UIView = {
    let bdView = UIView(frame: self.view.bounds)
    bdView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
    return bdView
}()

var menuView : TopView?
let menuHeight = UIScreen.main.bounds.height / 2
var isPresenting = false

init() {
    super.init(nibName: nil, bundle: nil)
    
    modalPresentationStyle = .custom
    transitioningDelegate = self
}

required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
}
    let categoryServices: CategoryService = CategoryService()
    public var categorys = [CategoryModel]()
    
    func CategoryInCollection() {
              self.categoryServices.getCategorys { (categorys) in
                self.menuView = TopView.newInstance(categorys: categorys)
                print(categorys)

                self.view.addSubview(self.menuView!)
                

                self.menuView!.backgroundColor = .red
                self.menuView!.translatesAutoresizingMaskIntoConstraints = false
                self.menuView!.heightAnchor.constraint(equalToConstant: self.menuHeight).isActive = true
                self.menuView!.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
                self.menuView!.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
                self.menuView!.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
                  
              }
          }

override func viewDidLoad() {
    super.viewDidLoad()

    
    view.backgroundColor = .clear
    view.addSubview(backdropView)
    
    CategoryInCollection()

    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(CategorysViewController.handleTap(_:)))
    backdropView.addGestureRecognizer(tapGesture)
    Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(self.updateVar), userInfo: nil,  repeats: true) }

    @objc func updateVar() {
        if(categorie.isHidden) {
             dismiss(animated: true, completion: nil)
            
            
        }
    }

@objc func handleTap(_ sender: UITapGestureRecognizer) {
    dismiss(animated: true, completion: nil)
}
}

extension CategorysViewController: UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {
func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    return self
}

func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    return self
}

func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
    return 1
}

func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
    let containerView = transitionContext.containerView
    let toViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)
    guard let toVC = toViewController else { return }
    isPresenting = !isPresenting
    categorie.isHidden = !isPresenting
    self.categoryServices.getCategorys { (categorys) in
        self.menuView = TopView.newInstance(categorys: categorys)
        if self.isPresenting == true {
                  
                   
                   containerView.addSubview(toVC.view)

                   self.menuView!.frame.origin.y += self.menuHeight
                   self.backdropView.alpha = 0

                   UIView.animate(withDuration: 0.4, delay: 0, options: [.curveEaseOut], animations: {
                       self.menuView!.frame.origin.y -= self.menuHeight
                       self.backdropView.alpha = 1
                   }, completion: { (finished) in
                       transitionContext.completeTransition(true)
                   })
               } else {
                   UIView.animate(withDuration: 0.4, delay: 0, options: [.curveEaseOut], animations: {
                       self.menuView!.frame.origin.y += self.menuHeight
                       self.backdropView.alpha = 0
                   }, completion: { (finished) in
                       transitionContext.completeTransition(true)
                   })
               }
           }

}
}


public struct categorie {
    static var value: String = ""
    static var isHidden: Bool = false
}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
class TopView : UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

            
            print("come on")
            print(self.categorys.count)
     
        return categorys.count;
    }
    

    let categoryServices: CategoryService = CategoryService()
    public var categorys = [CategoryModel]()
    lazy var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        //If you set it false, you have to add constraints.
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.delegate = self
        cv.dataSource = self
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "CategoryCollectionViewCell", bundle: bundle)
        cv.register(nib, forCellWithReuseIdentifier: "COLLECTION_CELL_CATEGORY_IDENTIFER")
        if let flowLayout = cv.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .horizontal
        }
       
        return cv
    }()
    func CategoryInCollection() {
           self.categoryServices.getCategorys { (categorys) in
               self.categorys = categorys
             print(categorys)
               
           }
       }


      class func newInstance(categorys: [CategoryModel]) -> TopView {
          
        let vc = TopView()
        vc.categorys = categorys
        return vc
      }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        CategoryInCollection()
        self.backgroundColor = .red

        addSubview(collectionView)

        //Add constraint
        collectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        CategoryInCollection()
    }

    

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
     
          let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "COLLECTION_CELL_CATEGORY_IDENTIFER", for: indexPath) as! CategoryCollectionViewCell
                      
                   
        print( categorys[indexPath.row].categoryName)
        cell.title!.text = categorys[indexPath.row].categoryName
        cell.title.backgroundColor = UIColor.red
        cell.picture?.image = UIImage(named: "workshop")
                      
                      
                     
        return cell
    }

    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("go to")
        categorie.value = categorys[indexPath.row].categoryName!
        categorie.isHidden = true
        print(categorie.value)
       
        self.isHidden = true
        
 
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
        {
         let width  = (self.frame.width-20)/3
              return CGSize(width: width, height: width)
        }
}
