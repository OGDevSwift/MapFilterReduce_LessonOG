//
//  ViewController.swift
//  MapFilterReduce
//
//  Created by Anatoliy Mamchenko on 09.03.2021.
//

import UIKit
import SnapKit

private let reuseIdentifire = "RickAndMortyCell"

class CharactersViewController: UIViewController {
    
    // MARK: Create model of heroes
    private var heroModels: [RickAndMortyModelProtocol] = [
        RickAndMortyHeroModel(name: "Rick", age: 65, imageName: "1", powerPoint: 300),
        RickAndMortyHeroModel(name: "Morty", age: 12, imageName: "2", powerPoint: 90),
        RickAndMortyHeroModel(name: "Abradolf Lincler", age: 16, imageName: "3", powerPoint: 50),
        RickAndMortyHeroModel(name: "Alan Rails", age: 28, imageName: "4", powerPoint: 70),
        RickAndMortyHeroModel(name: "Mr. Poopybutthole", age: 29, imageName: "5", powerPoint: 200),
        RickAndMortyHeroModel(name: "Birdperson‎", age: 40, imageName: "6", powerPoint: 170),
        RickAndMortyHeroModel(name: "Blim Blam", age: 50, imageName: "7", powerPoint: 100),
        RickAndMortyHeroModel(name: "Summer", age: 17, imageName: "8", powerPoint: 30),
        RickAndMortyHeroModel(name: "Jesus Christ", age: 2021, imageName: "9", powerPoint: 1000)
    ]
    // MARK: Create model of enemy
    private var enemyModel: RickAndMortyModelProtocol = RickAndMortyEnemyModel(name: "Gwendolyn", age: 18, imageName: "gwendolyn", powerPoint: 3290)
    
   
    // MARK: CREATE UI
    lazy private var collectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewFlowLayout()
        var collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.register(MyCell.self, forCellWithReuseIdentifier: reuseIdentifire)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private let wearArmorButton: UIButton = {
        let button = UIButton()
        button.isHidden = true
        button.setTitle("надеваем броню", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let leaveKidsAtHomeButton: UIButton = {
        let button = UIButton()
        button.setTitle("оставляем детей дома", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let letsBattleButton: UIButton = {
        let button: UIButton = UIButton()
        button.isHidden = true
        button.setTitle("идем в бой", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var enemyImageView: UIImageView = {
        let view: UIImageView = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.sizeToFit()
        view.image = UIImage(named: enemyModel.imageName)
        return view
    }()
    
    let battleResultLabel: UILabel = {
        let view: UILabel = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.lineBreakMode = .byWordWrapping
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 1
        view.numberOfLines = 0
        view.font = UIFont.systemFont(ofSize: view.font.pointSize, weight: .semibold)
        view.textAlignment = .center
        view.textColor = .black
        return view
    }()

    // MARK: Create our array
    private var imageArray: [UIImage]!
    private var arrayOfPoweredHero: [Int]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cofigureUI()
        configConstraints()
        getArrayOfImage()
        setGradientBackground()
    }
    
    // MARK: Create blur for cell background
    private func makingBlurEffectAtCell (cell: MyCell) {
        let blurEffect = UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.clipsToBounds = true
        blurEffectView.layer.cornerRadius = 30
        blurEffectView.frame = cell.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        cell.backgroundView = blurEffectView
    } // создаем эффект блюра, добавлем его на вью ячейки
    
    // MARK: Create gradient layer for collectionView background
    private func setGradientBackground() {
        let collectionViewBackgroundView = UIView()
        let colorTop =  UIColor(red: 255.0/255.0, green: 149.0/255.0, blue: 0.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 255.0/255.0, green: 94.0/255.0, blue: 58.0/255.0, alpha: 1.0).cgColor
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.frame
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 0.8]
        collectionView.backgroundView = collectionViewBackgroundView
        collectionView.backgroundView?.layer.addSublayer(gradientLayer)
    } // создаем вью, добавляем на него слой градиента и закидываем его как вью для collectionView
    
    // MARK: Get array Of Image
    private func getArrayOfImage () {
        
    }// получаем массив картинок наших героев
    
    // MARK: SetupUI Elements and add target to button
    private func cofigureUI () {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Rick and Morty Team"
        
        view.backgroundColor = .systemYellow
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        wearArmorButton.addTarget(self, action: #selector(wearArmorButtonAction), for: .touchUpInside)
        leaveKidsAtHomeButton.addTarget(self, action: #selector(leaveKidsAtHomeAction), for: .touchUpInside)
        letsBattleButton.addTarget(self, action: #selector(letsBattleButtonAction), for: .touchUpInside)
    }
    // MARK: Create button action
    @objc func leaveKidsAtHomeAction () {
        
        collectionView.reloadData()
        wearArmorButton.isHidden = false
        letsBattleButton.isHidden = false
        
    }
    
    @objc private func wearArmorButtonAction () {
        
        collectionView.reloadData()
        leaveKidsAtHomeButton.isHidden = false
    }
    
    
    
    @objc private func letsBattleButtonAction () {
        collectionView.removeFromSuperview()
        let fullPower: Int = 1 // считаем общее число сил Перепиши этот код кореш
        configBattleConstraints()
        if fullPower > enemyModel.powerPoint {
            battleResultLabel.text = "you win this battle!"
            battleResultLabel.backgroundColor = .systemGreen
        } else {
            battleResultLabel.text = "you suck"
            battleResultLabel.backgroundColor = .systemRed
        }
        
        [wearArmorButton, leaveKidsAtHomeButton, letsBattleButton].forEach({$0.isHidden = true})
    }
    
    //MARK: Constraints Configuration
    private func configConstraints () {
        
        [collectionView, wearArmorButton, leaveKidsAtHomeButton, letsBattleButton].forEach({view.addSubview($0)})
        
        collectionView.snp.makeConstraints { (make ) in
            make.top.equalTo(self.view.snp.top)
            make.leading.equalTo(self.view.snp.leading)
            make.trailing.equalTo(self.view.snp.trailing)
            make.height.equalTo(self.view).multipliedBy(0.8)
            
        }
        
        wearArmorButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.collectionView.snp.bottom)
            make.leading.equalTo(self.view.snp.leading)
            make.width.equalTo(self.view).multipliedBy(0.5)
            make.height.equalTo(self.view).multipliedBy(0.1)
        }
        
        leaveKidsAtHomeButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.collectionView.snp.bottom)
            make.trailing.equalTo(self.view.snp.trailing)
            make.width.equalTo(self.view).multipliedBy(0.5)
            make.height.equalTo(self.view).multipliedBy(0.1)
        }
        
        letsBattleButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.leaveKidsAtHomeButton.snp.bottom)
            make.leading.equalTo(self.view.snp.leading)
            make.trailing.equalTo(self.view.snp.trailing)
            make.height.equalTo(self.view).multipliedBy(0.05)
        }
    }
    
    private func configBattleConstraints () {
        
        [enemyImageView, battleResultLabel ].forEach({view.addSubview($0)})
        
        enemyImageView.snp.makeConstraints { (make ) in
            make.top.equalTo(self.view.snp.top).offset(180)
            make.leading.equalTo(self.view.snp.leading)
            make.trailing.equalTo(self.view.snp.trailing)
            make.height.equalTo(self.view).multipliedBy(0.4)
            
        }
        
        battleResultLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.enemyImageView.snp.bottom).offset(40)
            make.leading.equalTo(self.view.snp.leading).offset(30)
            make.trailing.equalTo(self.view.snp.trailing).offset(-30)
            make.height.equalTo(self.view).multipliedBy(0.1)
        }
    }
}
// MARK: UICollectionViewDelegate, UICollectionViewDataSource
extension CharactersViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return heroModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifire, for: indexPath) as! MyCell
        cell.layer.borderWidth = 0.3
        cell.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        cell.configConstraints()
        makingBlurEffectAtCell(cell: cell)
        cell.layer.cornerRadius = 30
        cell.nameLabel.text = "Name: \(heroModels[indexPath.row].name) "
        cell.ageLabel.text = "Age: \(heroModels[indexPath.row].age)"
        if let powered = arrayOfPoweredHero {
            cell.powerLabel.text = "Power: \(heroModels[indexPath.row].powerPoint) -> \(powered[indexPath.row])"
        }
        else {
        cell.powerLabel.text = "Power: \(heroModels[indexPath.row].powerPoint)"
        }
        return cell
    }
}
// MARK: UICollectionViewDelegateFlowLayout
extension CharactersViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 32, left: 8, bottom: 8, right: 8)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width - 36) / 2
        let height = (view.frame.height - 36) / 3
        return CGSize(width: width, height: height)
    }
}

