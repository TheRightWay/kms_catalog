Kms::ExternalsRegistry.register(:categories) {|_,_| Category.order('position asc').all.to_drop }
Kms::ExternalsRegistry.register(:products) {|_,_| Product.all.to_drop }
