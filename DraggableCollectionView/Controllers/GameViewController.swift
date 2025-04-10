//
//  ViewController.swift
//  WordSearch
//
//  Created by TonyNguyen on 5/9/19.
//  Copyright © 2019 Phuc Nguyen. All rights reserved.
//

import UIKit

/// This is the game view controller
class GameViewController: UIViewController {
    
    @IBOutlet weak var blurView: UIVisualEffectView!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var overlayView: LinesOverlay!
    @IBOutlet weak var gridCollectionView: UICollectionView!
    @IBOutlet weak var wordListCollectionView: WordListCollectionView!
    
    var gradientLayer: CAGradientLayer = CAGradientLayer()
    
    lazy var gridGenerator: WordGridGenerator = {
        return WordGridGenerator(words: words, row: nRow, column: nCol)
    }()
    
    let nRow = 12
    let nCol = 12
    var grid: Grid = Grid()
    
    private let words = [
        "OBJECTIVE-C",
        "SWIFT",
        "PHP",
        "JAVA",
        "JAVASCRIPT",
        "HTML",
        "CSS",
        "PYTHON"
    ]
    
    private var wordsFound = [""]
    
    /// Used to display elapsed time of the game.
    /// The timer can be paused and resumed.
    private var elapsedSeconds: Int = 0 {
        didSet {
            timerLabel.text = elapsedSeconds.formattedTime()
        }
    }
    private var timer: Timer?
    private var isPaused: Bool = false {
        didSet {
            if isPaused {
                timer?.invalidate()
            } else {
                startTimer()
            }
        }
    }
    
    /// We compute letter cell size. We then notify this to the overlay
    /// to draw the lines.
    /// This should be updated properly in case orientation changes.
    private var cellSize: CGSize {
        let w = gridCollectionView.bounds.width / CGFloat(nCol)
        let h = gridCollectionView.bounds.height / CGFloat(nRow)
        return CGSize(width: w, height: h)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // Because there's no layout constraint for a CALayer.
        gradientLayer.frame = gridCollectionView.bounds
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupWordListCollectionView()
        setupGridCollectionView()
        setupOverlayView()
        loadGame()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    fileprivate func restartGame() {
        overlayView.reset()
        elapsedSeconds = 0
        loadGame()
        wordListCollectionView.reset()
        wordsFound = []
    }
    
    @IBAction func restartGame(_ sender: Any) {
        restartGame()
    }
    
    @IBAction func selectAllWords(_ sender: Any) {
        
        wordsFound.removeAll()
        overlayView.reset()
        
        for word in words {
            select(word: word)
        }
    }
    
    @IBAction func quit(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func pauseToggle(_ sender: UIButton) {
        if isPaused {
            isPaused = false
            sender.setTitle("⏸", for: .normal)
        } else {
            isPaused = true
            sender.setTitle("▶️", for: .normal)
        }
        blurView.isHidden = !isPaused
    }
    
    private func loadGame() {
        DispatchQueue.global().async {
            if let grid = self.gridGenerator.generate() {
                self.grid = grid
                self.wordsFound = []
                                
                DispatchQueue.main.async {
                    self.gridCollectionView.reloadData()
                    self.startTimer()
                }
            }
        }
    }
    
    private func setupWordListCollectionView() {
        wordListCollectionView.words = gridGenerator.words
        wordListCollectionView.gameViewController = self
    }
    
    private func setupGridCollectionView() {
        
        // Setup pan gesture
        let panGR = UIPanGestureRecognizer(target: self, action: #selector(panHandling(gestureRecognizer:)))
        gridCollectionView.addGestureRecognizer(panGR)
        
        // Setup background gradient layer
//        gradientLayer.frame = gridCollectionView.bounds
//        
//        // Get the background color of the headerview
//        gradientLayer.colors = [UIColor(hexString: "#00FF00").cgColor, UIColor.white.cgColor]
//        let bgView = UIView(frame: gridCollectionView.bounds)
//        bgView.layer.insertSublayer(gradientLayer, at: 0)
//        gridCollectionView.backgroundView = bgView
        
        // Setup border for easing look
        gridCollectionView.layer.borderColor = UIColor.red.cgColor
        gridCollectionView.layer.borderWidth = 0.0
    }
    
    private func setupOverlayView() {
        overlayView.row = nRow
        overlayView.col = nCol
    }
    
    
    /// Helper function to get row and col from an indexPath.
    ///
    /// - Parameter index: an index from an indexPath.
    /// - Returns: row and col of the cell in the grid.
    private func position(from index: Int) -> Position {
        return Position(row: index / nRow, col: index % nCol)
    }
    
    /// Start and display clock time.
    private func startTimer() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (_) in
            self.elapsedSeconds += 1
        })
    }
    
    @objc func panHandling(gestureRecognizer: UIPanGestureRecognizer) {
        let point = gestureRecognizer.location(in: gridCollectionView)
        guard let indexPath = gridCollectionView.indexPathForItem(at: point) else {
            return
        }
        let pos = position(from: indexPath.row)
        
        switch gestureRecognizer.state {
        case .began:
            overlayView.selectingStyle.strokeColor = UIColor.random.cgColor
            overlayView.addTempLine(at: pos)
            // Select item to animate the cell
            // Since we set the collection view `selection mode` to single
            // This means only one letter is animated at a time.
            // So in `.ended` event, we just need to deselect one cell.
            gridCollectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
        case .changed:
            if overlayView.moveTempLine(to: pos) {
                gridCollectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
            }
        case .ended:
            // Stop animation
            //gridCollectionView.deselectItem(at: indexPath, animated: true)
            guard let startPos = overlayView.tempLine?.startPos else {
                return
            }
            // Get the word from the pre-computed map
            let key = WordGridGenerator.wordKey(for: startPos, and: pos)
            
            if let word = gridGenerator.wordsMap[key] {
                
                if wordsFound.contains(word) == false {
                    overlayView.acceptLastLine()
                    wordListCollectionView.select(word: word)
                    wordsFound.append(word)
                    if overlayView.permanentLines.count == gridGenerator.words.count {
                        // Pause the time because user has won the game.
                        timer?.invalidate()
                    }
                }
            } else {
                
                // Check for reverse word
                let key = WordGridGenerator.wordKey(for: pos, and: startPos)
                
                if let word = gridGenerator.wordsMap[key] {
                    
                    if wordsFound.contains(word) == false {
                        overlayView.acceptLastLine()
                        wordListCollectionView.select(word: word)
                        wordsFound.append(word)
                    }
                }
            }
            // Remove the temp line
            overlayView.removeTempLine()
            checkForWin()
        default: break
        }
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate(alongsideTransition: nil) { (_) in
            // Force re-draw the collection views when orientation changes.
            self.gridCollectionView.collectionViewLayout.invalidateLayout()
            self.wordListCollectionView.collectionViewLayout.invalidateLayout()
        }
    }
    
    func select(word: String) {
        
        for key in self.gridGenerator.wordsKeyMap {
            
            if key.word == word {
                
                
                // append selected word as found
                wordsFound.append(word)
                
                let positions = key.getPositions()
                wordListCollectionView.select(word: key.word)
                
                let startPos = Position(row: positions.first!.0, col: positions.first!.1)
                overlayView.addTempLine(at: startPos)
                
                for (row, col) in positions {
                    let pos = Position(row: row, col: col)
                    let _ = overlayView.moveTempLine(to: pos)
                    overlayView.acceptLastLine()
                }
            }
        }
        checkForWin()
    }
    
    func checkForWin() {
        if overlayView.permanentLines.count == gridGenerator.words.count {
            // Pause the time because user has won the game.
            timer?.invalidate()
            
            print("you won the game")
        }
    }
    
    func deselectAll() {
        for key in self.gridGenerator.wordsKeyMap {
            if words.contains(key.word) {
                let positions = key.getPositions()
                
                let startPos = Position(row: positions.first!.0, col: positions.first!.1)
                overlayView.addTempLine(at: startPos)
                
                for (row, col) in positions {
                    let pos = Position(row: row, col: col)
                    let _ = overlayView.moveTempLine(to: pos)
                    overlayView.removeTempLine()
                }
            }
        }
    }
}

extension GameViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return grid.count * (grid.first?.count ?? 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return cellSize
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GridCollectionViewCell.cellId, for: indexPath) as! GridCollectionViewCell
        let pos = position(from: indexPath.row)
        cell.label.text = String(grid[pos.row][pos.col])
        return cell
    }
}

