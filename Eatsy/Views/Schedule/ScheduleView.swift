import SwiftUI

struct ScheduleView: View {
    @StateObject private var vm: ScheduleViewModel
    @State private var showDivider: Bool = false // untuk garis bawah bar

    init(viewModel: ScheduleViewModel = ScheduleViewModel(repo: LocalScheduleRepository())) {
        _vm = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack {
            DateSegmentBar(selectedIndex: $vm.selectedDateIndex, titles: vm.dates)
                    .padding(.horizontal)
                    .frame(height: 44)
                    .background(Color("defaultBackground"))
                    .overlay(
                        Divider()
                            .background(Color(.systemGray4))
                            .opacity(showDivider ? 1 : 0),
                        alignment: .bottom
                    )
                    .zIndex(1)
//                    .padding(.vertical, 8)


            ScrollViewReader { proxy in
                ScrollView {
                    LazyVStack(alignment: .leading, spacing: 0) {
                        ForEach(MealSection.allCases) { section in
                            Text(section.rawValue)
                                .font(.subheadline)
                                .foregroundStyle(Color(.systemGray2))
                                .padding(.horizontal)
                                .padding(.vertical, 12)

                            VStack(spacing: 8) {
                                ForEach(vm.items(for: section)) { item in
                                    ScheduleMealRow(item: item)
                                        .padding(.horizontal)
                                }
                            }
                            .padding(.bottom, 16)
                        }
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
        .task { vm.onAppear() }
    }
}

// MARK: - Preview
#Preview {
    ScheduleView(viewModel: ScheduleViewModel(repo: LocalScheduleRepository()))
}
