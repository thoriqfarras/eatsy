import SwiftUI

struct ScheduleView: View {
    @StateObject private var vm: ScheduleViewModel

    // Inject VM (enak buat testing/preview)
    init(viewModel: ScheduleViewModel = ScheduleViewModel(repo: MockScheduleRepository())) {
        _vm = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 12) {

                // --- FIXED HEADER ---
                HStack {
                    Text("Schedule")
                        .font(.title.bold())
                    Spacer()
                    Image(systemName: "person.circle")
                        .font(.title3)
                }
                .padding(.horizontal)
                .padding(.top, 8)

                // --- FIXED SEGMENTED ---
                DateSegmentBar(selectedIndex: $vm.selectedDateIndex,
                               titles: vm.dates)
                    .padding(.horizontal)

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
                                .font(.subheadline.weight(.semibold))
                                .foregroundStyle(.secondary)
                                .padding(.horizontal)
                                .padding(.top, 8)

                            // Cards
                            VStack(spacing: 14) {
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
            .toolbar(.hidden, for: .navigationBar)
            .task { vm.onAppear() } // trigger load pertama
        }
    }
}

#Preview {
    ScheduleView(viewModel: ScheduleViewModel(repo: MockScheduleRepository()))
}
