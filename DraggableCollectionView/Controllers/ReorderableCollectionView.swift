//
//  ReorderableCollectionViewController.swift
//  DraggableCollectionView
//
//  Created by Phil Wright on 4/5/25.
//

import UIKit

class ReorderableCollectionViewController: UICollectionViewController, UICollectionViewDragDelegate, UICollectionViewDropDelegate {
    
    let fontName: String = "Avenir Next Bold"
    let fontSize: CGFloat = 16.0
    let textColor: UIColor = .black
    
    var font:UIFont {
        return UIFont(name: fontName, size: fontSize)!
    }
    
    // Sample data for the collection view
    var items = [
        "Consistent with words",
        "Consistent with actions",
        "Supportive",
        "Active Listening",
        "Shows empathy",
        "Is introspective",
        "Able to compromise",
        "Reciprocity",
        "Repairs after conflict",
        "Clear communication",
        "Active Listening",
        "Gives and takes feedback",
        "Over familiar",
        "Disconnected",
        "Not thoughtful",
        "Deflective",
        "Isn't self-reflective",
        "Hypercritical",
        "Hostile",
        "One-sided",
        "Lies",
        "Controlling"
    ]
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register the custom cell
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: "cell")
        
        // Configure drag and drop delegates
        collectionView.dragInteractionEnabled = true
        collectionView.dragDelegate = self
        collectionView.dropDelegate = self
        
        // Configure layout if needed
        if let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.itemSize = CGSize(width: 300, height: 50)
            flowLayout.minimumLineSpacing = 16
            flowLayout.minimumInteritemSpacing = 16
            flowLayout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        }
        
        // Find the UILongPressGestureRecognizer and shorten its minimumPressDuration.
        if let longPressGesture = collectionView.gestureRecognizers?.first(where: { $0 is UILongPressGestureRecognizer }) as? UILongPressGestureRecognizer {
            longPressGesture.minimumPressDuration = 0.2 // Default is usually 0.5 seconds.
        }
    }
    
    // MARK: - UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Dequeue our custom cell
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CustomCell else {
            fatalError("Unable to dequeue CustomCell")
        }
        
        
        let text = items[indexPath.item].uppercased()
        let attrString = NSMutableAttributedString(string: text)
        let attrsDict = [
            NSAttributedString.Key.strikethroughStyle: 0,
            NSAttributedString.Key.foregroundColor: UIColor.black,
            NSAttributedString.Key.font: font] as [NSAttributedString.Key : Any]
        attrString.addAttributes(attrsDict, range: NSRange(location: 0, length: text.count))
        
        cell.label.attributedText = attrString
        cell.label.textColor = self.textColor
        cell.label.font = self.font
        cell.label.text = text
        return cell
    }
    
    // MARK: - UICollectionViewDragDelegate
    
    func collectionView(_ collectionView: UICollectionView,
                        itemsForBeginning session: UIDragSession,
                        at indexPath: IndexPath) -> [UIDragItem] {
        
        print("dragSession started")
        let item = items[indexPath.item]
        let itemProvider = NSItemProvider(object: item as NSString)
        let dragItem = UIDragItem(itemProvider: itemProvider)
        dragItem.localObject = item
        return [dragItem]
    }
    
    // MARK: - UICollectionViewDropDelegate
    
    func collectionView(_ collectionView: UICollectionView, performDropWith coordinator: UICollectionViewDropCoordinator) {
        // Determine destination index path
        let destinationIndexPath: IndexPath
        if let indexPath = coordinator.destinationIndexPath {
            destinationIndexPath = indexPath
        } else {
            let section = collectionView.numberOfSections - 1
            let row = collectionView.numberOfItems(inSection: section)
            destinationIndexPath = IndexPath(item: row, section: section)
        }
        
        // Handle each item being dropped
        coordinator.items.forEach { dropItem in
            if let sourceIndexPath = dropItem.sourceIndexPath {
                collectionView.performBatchUpdates({
                    
                    let item = items.remove(at: sourceIndexPath.item)
//                    // Update data source
//                    var adjustedIndex = destinationIndexPath.item
//                    // Adjust the destination index if the item is moved downwards
//                    if sourceIndexPath.item < destinationIndexPath.item {
//                        adjustedIndex -= 1
//                    }
                    items.insert(item, at: destinationIndexPath.item)

                    // Update collection view
                    collectionView.deleteItems(at: [sourceIndexPath])
                    collectionView.insertItems(at: [destinationIndexPath])
                }, completion: nil)
                coordinator.drop(dropItem.dragItem, toItemAt: destinationIndexPath)
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        canHandle session: UIDropSession) -> Bool {
        return session.canLoadObjects(ofClass: NSString.self)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        dropSessionDidUpdate session: UIDropSession,
                        withDestinationIndexPath destinationIndexPath: IndexPath?) -> UICollectionViewDropProposal {
        // Use move operation if dragging within the same app, otherwise copy.
        if collectionView.hasActiveDrag {
            return UICollectionViewDropProposal(operation: .move, intent: .insertAtDestinationIndexPath)
        } else {
            return UICollectionViewDropProposal(operation: .copy, intent: .insertAtDestinationIndexPath)
        }
    }
}

