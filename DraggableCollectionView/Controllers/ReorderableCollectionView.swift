//
//  ReorderableCollectionView.swift
//  DraggableCollectionView
//
//  Created by Phil Wright on 4/5/25.
//

import UIKit

class ReorderableCollectionView: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let fontName: String = "Avenir Next Medium"
    let fontSize: CGFloat = 18.0
    let textColor: UIColor = .black
    var cellBackgroundColor: UIColor = .clear
    
    var font: UIFont {
        return UIFont(name: fontName, size: fontSize)!
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: "draggableCell")
        
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongGesture(gesture:)))
        longPressGesture.minimumPressDuration = 0.2
        collectionView.addGestureRecognizer(longPressGesture)
    }
    
    // MARK: - UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Dequeue our custom cell
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "draggableCell", for: indexPath) as? CustomCell else {
            fatalError("Unable to dequeue CustomCell")
        }
        setupCell(cell: cell, indexPath: indexPath)
        return cell
    }
    
    func setupCell(cell: CustomCell, indexPath: IndexPath) {
        let text = items[indexPath.item].uppercased()
        let attrString = NSMutableAttributedString(string: text)
        let attrsDict = [
            NSAttributedString.Key.strikethroughStyle: 0,
            NSAttributedString.Key.foregroundColor: UIColor.black,
            NSAttributedString.Key.font: font] as [NSAttributedString.Key : Any]
        attrString.addAttributes(attrsDict, range: NSRange(location: 0, length: text.count))
        
        cell.label.attributedText = attrString
        cell.label.font = font
        cell.label.text = text
        cell.label.textColor = textColor
        cell.contentView.backgroundColor = UIColor.random
    }
    
    @objc func handleLongGesture(gesture: UILongPressGestureRecognizer) {
        switch gesture.state {
        case .began:
            guard let selectedIndexPath = collectionView.indexPathForItem(at: gesture.location(in: collectionView)) else {
                break
            }
            collectionView.beginInteractiveMovementForItem(at: selectedIndexPath)
        case .changed:
            collectionView.updateInteractiveMovementTargetPosition(gesture.location(in: gesture.view!))
        case .ended:
            collectionView.endInteractiveMovement()
        default:
            collectionView.cancelInteractiveMovement()
        }
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 360, height: 60)
    }
    
    // MARK: - Reordering
    override func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath,
                                 to destinationIndexPath: IndexPath) {
        let movedItem = items.remove(at: sourceIndexPath.item)
        items.insert(movedItem, at: destinationIndexPath.item)
        
        print(items)
    }
}
