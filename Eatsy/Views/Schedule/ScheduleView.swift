import SwiftUI

struct ScheduleView: View {
    @StateObject private var vm: ScheduleViewModel

    // Inject VM (enak buat testing/preview)
    init(viewModel: ScheduleViewModel = ScheduleViewModel(repo: LocalScheduleRepository())) {
        _vm = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack(spacing: 12) {
            // --- FIXED SEGMENTED NEW ---
            DateSegmentBar(selectedIndex: $vm.selectedDateIndex,
                           titles: vm.dates)
                .padding(.horizontal)
                .padding(.top, 8)

            // --- ONLY THIS PART SCROLLS ---
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 0) {

                    if let msg = vm.errorMessage {
                        Text(msg)
                            .foregroundStyle(.red)
                            .padding()
                    }

                    if vm.isLoading && vm.dates.isEmpty {
                        ProgressView()
                            .padding()
                    }

                    ForEach(MealSection.allCases) { section in
                        // Section header
                        Text(section.rawValue)
                            .font(.subheadline)
                            .foregroundStyle(Color(.systemGray2))
                            .padding(.horizontal)
                            .padding(.vertical, 8)

                        // Cards
                        VStack(spacing: 8) {
                            ForEach(vm.items(for: section)) { item in
                                ScheduleMealRow(item: item)
                                    .padding(.horizontal)
                            }
                        }
                        .padding(.bottom, 12)
                    }

                    Spacer(minLength: 16)
                }
            }
            .scrollIndicators(.hidden)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("defaultBackground"))
        .task { vm.onAppear() } // trigger load pertama
    }
}

#Preview {
    ScheduleView(viewModel: ScheduleViewModel(repo: LocalScheduleRepository()))
}
