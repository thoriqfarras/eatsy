import SwiftUI

struct ScheduleMealRow: View {
    let item: MealItem
    
    var body: some View {
        HStack(spacing: 12) {
            // Left thumbnail
            ZStack {
                RoundedRectangle(cornerRadius: 14, style: .continuous)
                    .fill(.ultraThinMaterial)
                Text(item.emoji)
                    .font(.system(size: 28))
            }
            .frame(width: 56, height: 56)
            
            // Title + nutrients
            VStack(alignment: .leading, spacing: 10) {
                Text(item.title)
                    .font(.headline)
                
                HStack(spacing: 0) {
                    ForEach(item.nutrients.indices, id: \.self) { i in
                        let n = item.nutrients[i]
                        HStack(spacing: 6) {
                            Image(systemName: n.icon)
                                .foregroundStyle(.secondary)
                            VStack(alignment: .leading, spacing: 2) {
                                Text(n.name)
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                                Text(n.value)
                                    .font(.caption.weight(.semibold))
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        if i < item.nutrients.count - 1 {
                            Divider().frame(height: 18)
                        }
                    }
                }
            }
            Spacer(minLength: 0)
        }
        .padding(14)
        .background(
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .fill(Color(.systemBackground))
                .shadow(color: .black.opacity(0.08), radius: 8, y: 2)
        )
    }
}
