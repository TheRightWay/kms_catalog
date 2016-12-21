Kms::AbilityService.register do
  can :manage, Kms::Category
  can :manage, Kms::Product
end
