Kms::AbilityService.register do
  can :manage, Category
  can :manage, Product
end
