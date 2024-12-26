//
//  CategorySelectionView.swift
//  NextUp
//
//  Created by Yonatan Tussa on 12/22/24.
//
import SwiftUI

struct DashboardView: View {
    
    var userName: String
    var userEmail: String
    
    @Environment(\.colorScheme) var colorScheme
    
    @State private var selectedTab: String = "To do"
    @State private var showSearch: Bool = false
    @State private var isExpanded: Bool = false
    // Will likely move this to UserDefaults
    @State private var projects = [
        "To do": [String](),
        "In progress": [String](),
        "Finished": [String]()
    ]
    
    let recentContent = "Learn Swift Programming"
    let recommendations = [
        ("Swift UI Tutorials", "Tutorial", "https://stream-blog-v2.imgix.net/blog/wp-content/uploads/0d7a5c11a88a4954114743715c26092d/swiftui.jpeg?auto=format&auto=compress&w=800&fit=max"),
        ("Understanding Closures in Swift", "Article", "https://images.squarespace-cdn.com/content/v1/63139bb1e1a1a078e071f30c/24a88bd8-5b58-4584-8c39-eb638a8a182f/3+Mistakes+Closures.001.png?format=2500w"),
        ("Building iOS Apps with Swift", "Course", "https://swift.org/assets/images/getting-started-guides/swiftui-ios/initial-view.png"),
        ("Swift over Coffee", "Podcast", "https://is1-ssl.mzstatic.com/image/thumb/Podcasts125/v4/53/b2/7c/53b27c14-23ff-06a5-2eb5-1c2ba6855828/mza_7272686623588747909.jpg/300x300bb.webp")
    ]
    
    let cookingRecommendations = [
        ("Easy Pasta Recipes", "Video", "https://example.com/pasta.jpg"),
        ("Mastering Baking Basics", "Article", "https://example.com/baking.jpg"),
        ("Healthy Meal Prepping", "Course", "https://example.com/meals.jpg"),
        ("Culinary Arts Podcast", "Podcast", "https://example.com/podcast.jpg")
    ]
    
    let artRecommendations = [
        ("Intro to Watercolors", "Video", "https://example.com/watercolors.jpg"),
        ("Sketching Basics", "Article", "https://example.com/sketching.jpg"),
        ("Learn Acrylic Painting", "Course", "https://example.com/acrylic.jpg"),
        ("Art History Podcast", "Podcast", "https://example.com/arthistory.jpg")
    ]
    
    var body: some View {
        NavigationView {
            TabView {
                // Explore Tab
                GeometryReader { geometry in
                    ScrollView {
                        VStack {
                            HStack {
                                Button(action: {
                                    showSearch.toggle()
                                }) {
                                    Image(systemName: "magnifyingglass")
                                        .font(.title2)
                                        .fontWeight(.heavy)
                                        //.foregroundColor(.black)
                                }
                                .padding(.leading, 15)
                                
                                Spacer()
                                
                                Button(action: {
                                    print("Saved button selected")
                                }) {
                                    Image(systemName: "heart")
                                        .font(.title2)
                                        .fontWeight(.heavy)
                                        //.foregroundColor(.black)
                                }
                                .padding(.trailing, 15)
                            }
                            .padding(.top, 10)
                            
                            VStack(alignment: .leading, spacing: 20) {
                                Text("Welcome back, \(userName).")
                                    .font(.title)
                                    .fontWeight(.heavy)
                                    .padding(.bottom, 10)
                                
                                Text("Ready to pick up where you left off?")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                    .padding(.bottom, 20)
                                
                                // Recent Learning Material
                                CardView(content: recentContent, type: "Tutorial", imageUrl: "https://images.javatpoint.com/tutorial/swift/images/swift-tutorial.png")
                                    .frame(width: UIScreen.main.bounds.width * 0.9, height: 240)
                                    .padding(.bottom, 10)
                                    .frame(maxWidth: .infinity, alignment: .center)
                                
                                // Recommended Content
                                VStack(alignment: .leading, spacing: 10) {
                                    HStack {
                                        Text("Perfect for you")
                                            .font(.headline)
                                            .padding(.bottom, 10)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        
                                        Button(action: {
                                            withAnimation {
                                                isExpanded.toggle()
                                            }
                                        }) {
                                            Text(isExpanded ? "See less" : "See more")
                                                .font(.subheadline)
                                                .foregroundColor(.accentColor)
                                                .padding(.bottom, 10)
                                        }
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                    }
                                    
                                    // Show content in carousel or grid view
                                    if isExpanded {
                                        LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))], spacing: 20) {
                                            ForEach(recommendations, id: \.0) { recommendation in
                                                CardView(content: recommendation.0, type: recommendation.1, imageUrl: recommendation.2)
                                                    .frame(height: 240)
                                                    .clipped()
                                            }
                                        }
                                        .frame(height: geometry.size.height * 0.5)
                                    } else {
                                        ScrollView(.horizontal, showsIndicators: false) {
                                            HStack(spacing: 15) {
                                                ForEach(recommendations, id: \.0) { recommendation in
                                                    CardView(content: recommendation.0, type: recommendation.1, imageUrl: recommendation.2)
                                                        .frame(width: UIScreen.main.bounds.width * 0.8, height: 240)
                                                        .clipped()
                                                }
                                            }
                                        }
                                    }
                                }
                                .padding(.top, 20)
                            }
                            .padding()
                            .padding(.top, 25)
                        }
                    }
                }
                .tabItem {
                    Label("Explore", systemImage: "safari")
                }
                
                // Categories Tab
                GeometryReader { geometry in
                    ScrollView {
                        VStack {
                            HStack {
                                Button(action: {
                                    showSearch.toggle()
                                }) {
                                    Image(systemName: "magnifyingglass")
                                        .font(.title2)
                                        .fontWeight(.heavy)
                                        //.foregroundColor(.black)
                                }
                                .padding(.leading, 15)
                                
                                Spacer()
                                
                                Button(action: {
                                    print("Saved button selected")
                                }) {
                                    Image(systemName: "heart")
                                        .font(.title2)
                                        .fontWeight(.heavy)
                                        //.foregroundColor(.black)
                                }
                                .padding(.trailing, 15)
                            }
                            .padding(.top, 10)
                            
                            VStack(alignment: .leading, spacing: 20) {
                                Text("Try something new.")
                                    .font(.title)
                                    .fontWeight(.heavy)
                                    .padding(.bottom, 10)
                                
                                Text("Find your next focus and continue learning.")
                                    .font(.system(size: 15))
                                    .foregroundColor(.gray)
                                    .padding(.bottom, 20)
                                
                                // Cooking Carousel
                                VStack(alignment: .leading) {
                                    Text("Cooking")
                                        .font(.headline)
                                    
                                    ScrollView(.horizontal, showsIndicators: false) {
                                        HStack(spacing: 15) {
                                            ForEach(cookingRecommendations, id: \.0) { recommendation in
                                                CardView(content: recommendation.0, type: recommendation.1, imageUrl: recommendation.2)
                                                    .frame(width: UIScreen.main.bounds.width * 0.8, height: 240)
                                                    .clipped()
                                            }
                                        }
                                    }
                                }
                                
                                // Art Carousel
                                VStack(alignment: .leading) {
                                    Text("Art")
                                        .font(.headline)
                                    
                                    ScrollView(.horizontal, showsIndicators: false) {
                                        HStack(spacing: 15) {
                                            ForEach(artRecommendations, id: \.0) { recommendation in
                                                CardView(content: recommendation.0, type: recommendation.1, imageUrl: recommendation.2)
                                                    .frame(width: UIScreen.main.bounds.width * 0.8, height: 240)
                                                    .clipped()
                                            }
                                        }
                                    }
                                }
                                .padding(.top, 30)
                            }
                            .padding()
                            .padding(.top, 25)
                        }
                    }
                }
                .tabItem {
                    Label("Categories", systemImage: "square.grid.2x2")
                }
                
                // Projects Tab
                GeometryReader { geometry in
                    ScrollView {
                        VStack {
                            Text("Projects")
                                .font(.headline)
                                .fontWeight(.bold)
                                .padding()
                            
                            Picker("Select Tab", selection: $selectedTab) {
                                Text("To do").tag("To do")
                                Text("In progress").tag("In progress")
                                Text("Finished").tag("Finished")
                            }
                            .pickerStyle(SegmentedPickerStyle())
                            .padding(.horizontal)
                            .padding(.top, 10)
                                                        
                            if selectedTab == "To do" {
                                if projects["To do"]?.isEmpty ?? true {
                                    VStack {
                                        /*
                                         Image(systemName: "doc.text.fill")
                                         .resizable()
                                         .scaledToFit()
                                         .frame(width: 100, height: 100)
                                         .padding()
                                         */
                                        
                                        Text("Nothing here. For now.")
                                            .font(.title2)
                                            .fontWeight(.heavy)
                                            .multilineTextAlignment(.center)
                                            .fixedSize(horizontal: false, vertical: true)
                                            .frame(width: geometry.size.width * 0.6)
                                            .padding(.top)
                                            .padding(.bottom, 5)
                                        
                                        Text("This is where you'll find your planned projects.")
                                            .font(.subheadline)
                                            .foregroundColor(.gray)
                                            .multilineTextAlignment(.center)
                                            .fixedSize(horizontal: false, vertical: true)
                                            .frame(width: geometry.size.width * 0.6)
                                            .padding(.bottom)
                                        
                                        Button("Start a project") {
                                            print("add project to To do")
                                        }
                                        .padding()
                                        .background(Color(hex: "#00B3FF"))
                                        .foregroundColor(.white)
                                        .font(.system(size:15, weight: .semibold))
                                        .cornerRadius(15)
                                    }
                                    .frame(height: geometry.size.height * 0.8)
                                } else {
                                    ForEach(projects["To do"] ?? [], id: \.self) { project in Text(project)
                                    }
                                }
                            } else if selectedTab == "In progress" {
                                if projects["In progress"]?.isEmpty ?? true {
                                    VStack {
                                        Text("Nothing here. For now.")
                                            .font(.title2)
                                            .fontWeight(.heavy)
                                            .multilineTextAlignment(.center)
                                            .fixedSize(horizontal: false, vertical: true)
                                            .frame(width: geometry.size.width * 0.6)
                                            .padding(.top)
                                            .padding(.bottom, 5)
                                        
                                        Text("This is where you'll find your in progress projects.")
                                            .font(.subheadline)
                                            .foregroundColor(.gray)
                                            .multilineTextAlignment(.center)
                                            .fixedSize(horizontal: false, vertical: true)
                                            .frame(width: geometry.size.width * 0.6)
                                            .padding(.bottom)
                                        
                                        Button("Start a project") {
                                            print("add project to To do")
                                        }
                                        .padding()
                                        .background(Color(hex: "#00B3FF"))
                                        .foregroundColor(.white)
                                        .font(.system(size:15, weight: .semibold))
                                        .cornerRadius(15)
                                    }
                                    .frame(height: geometry.size.height * 0.8)
                                } else {
                                    ForEach(projects["In progress"] ?? [], id: \.self) { project in Text(project)
                                    }
                                }
                            } else if selectedTab == "Finished" {
                                if projects["Finished"]?.isEmpty ?? true {
                                    VStack {
                                        Text("Nothing here. For now.")
                                            .font(.title2)
                                            .fontWeight(.heavy)
                                            .multilineTextAlignment(.center)
                                            .fixedSize(horizontal: false, vertical: true)
                                            .frame(width: geometry.size.width * 0.6)
                                            .padding(.top)
                                            .padding(.bottom, 5)
                                        
                                        Text("This is where you'll find your finished projects.")
                                            .font(.subheadline)
                                            .foregroundColor(.gray)
                                            .multilineTextAlignment(.center)
                                            .fixedSize(horizontal: false, vertical: true)
                                            .frame(width: geometry.size.width * 0.6)
                                            .padding(.bottom)
                                        
                                        Button("Start a project") {
                                            print("add project to To do")
                                        }
                                        .padding()
                                        .background(Color(hex: "#00B3FF"))
                                        .foregroundColor(.white)
                                        .font(.system(size:15, weight: .semibold))
                                        .cornerRadius(15)
                                    }
                                    .frame(height: geometry.size.height * 0.8)
                                } else {
                                    ForEach(projects["Finished"] ?? [], id: \.self) { project in Text(project)
                                    }
                                }
                            }
                        }
                    }
                }
                .tabItem {
                    Label("Projects", systemImage: "pencil")
                }
                
                // Profile Tab
                GeometryReader { geometry in
                    ScrollView {
                        VStack {
                            Text("Profile")
                                .font(.headline)
                                .fontWeight(.bold)
                                .padding()
                            
                            VStack {
                                
                                Image("Avatar")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 110, height: 110)
                                
                                Text(UserDefaults.standard.string(forKey: "userName") ?? "User")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .padding(.top, 10)
                                
                                Text(UserDefaults.standard.string(forKey: "topInterest") ?? "No interest set")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            .frame(maxWidth: .infinity, alignment: .center)
                                                        
                            // Settings and Preferences Section
                            VStack(alignment: .leading, spacing: 20) {
                                // Preferences
                                Button(action: {
                                    print("Preferences tapped")
                                }) {
                                    HStack {
                                        Text("Preferences")
                                            .font(.body)
                                            .foregroundColor(colorScheme == .dark ? .white : .black)
                                        Spacer()
                                        Image(systemName: "chevron.right")
                                            .foregroundColor(.gray)
                                    }
                                }
                                .padding()
                                .background(Color.gray.opacity(0.1))
                                .cornerRadius(10)
                                
                                // Notifications
                                Button(action: {
                                    print("Notifications tapped")
                                }) {
                                    HStack {
                                        Text("Notifications")
                                            .font(.body)
                                            .foregroundColor(colorScheme == .dark ? .white : .black)
                                        Spacer()
                                        Image(systemName: "chevron.right")
                                            .foregroundColor(.gray)
                                    }
                                }
                                .padding()
                                .background(Color.gray.opacity(0.1))
                                .cornerRadius(10)
                                
                                // Privacy & Security
                                Button(action: {
                                    print("Privacy & Security tapped")
                                }) {
                                    HStack {
                                        Text("Privacy & Security")
                                            .font(.body)
                                            .foregroundColor(colorScheme == .dark ? .white : .black)
                                        Spacer()
                                        Image(systemName: "chevron.right")
                                            .foregroundColor(.gray)
                                    }
                                }
                                .padding()
                                .background(Color.gray.opacity(0.1))
                                .cornerRadius(10)
                                
                                // Settings
                                Button(action: {
                                    print("Settings tapped")
                                }) {
                                    HStack {
                                        Text("Settings")
                                            .font(.body)
                                            .foregroundColor(colorScheme == .dark ? .white : .black)
                                        Spacer()
                                        Image(systemName: "chevron.right")
                                            .foregroundColor(.gray)
                                    }
                                }
                                .padding()
                                .background(Color.gray.opacity(0.1))
                                .cornerRadius(10)
                            }
                            .padding(.horizontal, 20)
                            .padding(.top, 30)
                        }
                    }
                }
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
            }
            .onAppear {
                let appearance = UITabBarAppearance()
                appearance.configureWithOpaqueBackground()
                // appearance.backgroundColor = UIColor.white
                appearance.stackedLayoutAppearance.selected.iconColor = UIColor(Color(hex:"#00B3FF"))
                appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: (colorScheme == .dark ? UIColor.white : UIColor.black)]
                // appearance.stackedLayoutAppearance.normal.iconColor = UIColor(Color(hex: "#00B3FF"))
                // appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.black]
                
                UITabBar.appearance().standardAppearance = appearance
                UITabBar.appearance().scrollEdgeAppearance = appearance
            }
        }
        .navigationBarBackButtonHidden(true)
        .accentColor(Color(hex: "#00B3FF"))
    }
}

#Preview {
    DashboardView(userName: "Yonatan", userEmail: "yizzo@gmail.com")
}
