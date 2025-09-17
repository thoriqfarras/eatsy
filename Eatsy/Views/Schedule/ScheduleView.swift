import SwiftUI

struct ScheduleView: View {
    @State private var showDivider: Bool = false // untuk garis bawah bar
    
    @EnvironmentObject var recommendationViewModel: RecommendationViewModel

    var body: some View {
        VStack {

            ScrollViewReader { proxy in
                ScrollView {
                    LazyVStack(alignment: .leading, spacing: 0) {
                            Text("Breakfast")
                                .font(.subheadline)
                                .foregroundStyle(Color(.systemGray2))
                                .padding(.horizontal)
                                .padding(.vertical, 12)

                            VStack(spacing: 8) {
                                ForEach(recommendationViewModel.recommendations[1].breakfasts) { meal in
                                    ScheduleMealRow(meal: meal, mealType: .breakfast)
                                        .padding(.horizontal)
                                }
                            }
                            .padding(.bottom, 16)
                        Text("Lunch")
                                .font(.subheadline)
                                .foregroundStyle(Color(.systemGray2))
                                .padding(.horizontal)
                                .padding(.vertical, 12)

                            VStack(spacing: 8) {
                                ForEach(recommendationViewModel.recommendations[1].lunches) { meal in
                                    ScheduleMealRow(meal: meal, mealType: .lunch)
                                        .padding(.horizontal)
                                }
                            }
                            .padding(.bottom, 16)
                        Text("Dinner")
                                .font(.subheadline)
                                .foregroundStyle(Color(.systemGray2))
                                .padding(.horizontal)
                                .padding(.vertical, 12)

                            VStack(spacing: 8) {
                                ForEach(recommendationViewModel.recommendations[1].dinners) { meal in
                                    ScheduleMealRow(meal: meal, mealType: .dinner)
                                        .padding(.horizontal)
                                }
                            }
                            .padding(.bottom, 16)
                        
                    }
                    .background(
                        GeometryReader { geo in
                            Color.clear
                                .onChange(of: geo.frame(in: .named("scroll")).minY) { value in
                                    showDivider = value < 0
                                }
                        }
                    )
                }
                .coordinateSpace(name: "scroll")
                .scrollIndicators(.hidden)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("defaultBackground"))
    }
}

// MARK: - Preview
#Preview {
    ScheduleView()
}
