//
//  CategorySelectionView.swift
//  NextUp
//
//  Created by Yonatan Tussa on 12/22/24.
//
import SwiftUI

struct DashboardView: View {
    @State private var selectedTopic: String? = nil
    //@State private var currentStep: Double = 0.75
    @State private var userName: String = "Yonatan"
    @State private var showSearch: Bool = false
    
    //let topics = ["Learn Programming", "Create Projects", "Join a Community", "Explore Resources"]
    
    let recentContent = "Learn Swift Programming"
    let recommendations = [
        ("Swift UI Tutorials", "Tutorial", "https://stream-blog-v2.imgix.net/blog/wp-content/uploads/0d7a5c11a88a4954114743715c26092d/swiftui.jpeg?auto=format&auto=compress&w=800&fit=max"),
        ("Understanding Closures in Swift", "Article", "https://images.squarespace-cdn.com/content/v1/63139bb1e1a1a078e071f30c/24a88bd8-5b58-4584-8c39-eb638a8a182f/3+Mistakes+Closures.001.png?format=2500w"),
        ("Building iOS Apps with Swift", "Course", "https://swift.org/assets/images/getting-started-guides/swiftui-ios/initial-view.png"),
        ("Swift over Coffee", "Podcast", "https://is1-ssl.mzstatic.com/image/thumb/Podcasts125/v4/53/b2/7c/53b27c14-23ff-06a5-2eb5-1c2ba6855828/mza_7272686623588747909.jpg/300x300bb.webp")
    ]
    
    var body: some View {
        TabView {
            // Explore Tab
            VStack {
                HStack {
                    Button(action: {
                        showSearch.toggle()
                    }) {
                        Image(systemName: "magnifyingglass")
                            .font(.title2)
                            .foregroundColor(.black)
                    }
                    .padding(.leading, 15)
                    
                    Spacer()
                    
                    Button(action: {
                        print("Saved button selected")
                    }) {
                        Image(systemName: "heart")
                            .font(.title2)
                            .foregroundColor(.black)
                    }
                    .padding(.trailing, 15)
                }
                .padding(.top, 10)
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("Welcome back, \(userName).")
                        .font(.system(size:28, weight: .heavy))
                        .foregroundColor(.black)
                        .padding(.bottom, 10)
                    
                    Text("Ready to pick up where you left off?")
                        .font(.system(size:15))
                        .foregroundColor(.gray)
                        .padding(.bottom, 20)
                    
                    // Recent Learning Material
                    VStack {
                         CardView(content: recentContent, type: "Tutorial", imageUrl: "https://images.javatpoint.com/tutorial/swift/images/swift-tutorial.png")
                            .frame(maxWidth: .infinity)
                            .padding(.bottom, 20)
                    }
                    
                    // Recomended Content
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Text("Perfect for you")
                                .font(.headline)
                                .padding(.bottom, 10)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Button(action: {
                                print("See more recommendations button selected")
                            }) {
                                Text("See more")
                                    .font(.subheadline)
                                    .foregroundColor(.blue)
                                    .padding(.bottom, 10)
                            }
                            .frame(maxWidth: .infinity, alignment: .trailing)
                        }
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 15) {
                                ForEach(recommendations, id: \.0) { recommendation in CardView(content: recommendation.0, type: recommendation.1, imageUrl: recommendation.2)
                                }
                            }
                        }
                        
                    }
                    .padding(.top, 30)
                    Spacer()
                }
                .padding()
                .padding(.top, 25)
            }
            .tabItem {
                Label("Explore", systemImage: "safari")
            }
            
            // Categories Tab
            Text("Categories View")
                .tabItem {
                    Label("Categories", systemImage: "square.grid.2x2")
                }
            
            // Projects Tab
            Text("Projects View")
                .tabItem {
                    Label("Projects", systemImage: "pencil")
                }
            
            // Profile Tab
            Text("Profile View")
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
        .navigationBarBackButtonHidden(true)
        .accentColor(Color(hex: "#00B3FF"))
    }
}

#Preview {
    DashboardView()
}
