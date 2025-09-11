import SwiftUI

struct ScheduleView: View {
    @StateObject private var vm: ScheduleViewModel

    // Inject VM (enak buat testing/preview)
    init(viewModel: ScheduleViewModel = ScheduleViewModel(repo: LocalScheduleRepository())) {
            _vm = StateObject(wrappedValue: viewModel)
        }

    var body: some View {
        NavigationStack {
            VStack(spacing: 12) {
                
                HStack {
                    Text("Schedule")
                        .font(.title)
                        .bold()
                    
                    Spacer()
                    
                    NavigationLink {
                        ProfileView()   // nanti arahkan ke view profil kamu
                    } label: {
                        Image(systemName: "person.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 28, height: 28)
                            .foregroundColor(.white)
                            .background(Circle().fill(Color.gray))
                    }
                    .navigationTitle("Back")
                    
                }
                .padding(.horizontal)
                .padding(.top, 12)


                // --- FIXED SEGMENTED NEW ---
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
    ScheduleView(viewModel: ScheduleViewModel(repo: LocalScheduleRepository()))
}
