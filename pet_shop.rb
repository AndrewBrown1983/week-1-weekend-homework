def pet_shop_name(pet_shop)
  return pet_shop[:name]
end

def total_cash(pet_shop)
  return pet_shop[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop, amount)

  return pet_shop[:admin][:total_cash] += amount

end

def pets_sold(pet_shop)

  return pet_shop[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop, num)
  return pet_shop[:admin][:pets_sold] += num
end

def stock_count(pet_shop)
  return pet_shop[:pets].length

end

def pets_by_breed(pet_shop, type)
  total = []
  for pet in pet_shop[:pets]
    if pet[:breed] == type
      total.push(pet)
    end
  end
  return total

end

def find_pet_by_name(pet_shop, name)
  for pet in pet_shop[:pets]
    if pet[:name] == name
      return pet

    end
  end
  return nil
end

def remove_pet_by_name(pet_shop, name)
  for pet in pet_shop[:pets]
    if pet[:name] == name
      pet_shop[:pets].delete(pet)
    end
  end
end

def add_pet_to_stock(pet_shop, new_pet)
  pet_shop[:pets] << new_pet
  return pet_shop[:pets].length()

end
def customer_cash(customers)
  return customers[:cash]
end


def remove_customer_cash(customers, amount)

  customers[:cash] -= amount
end

def customer_pet_count(customers)
  return customers[:pets].length()
end

def add_pet_to_customer(customers, new_pet)
  customers[:pets] << new_pet
  return customers[:pets].length()

end

def customer_can_afford_pet(customers, new_pet)
  if customers[:cash] >= new_pet[:price]
    return true
  else
    return false
  end
end


def sell_pet_to_customer(pet_shop, pet, customers)
if pet != nil && customer_can_afford_pet(customers, pet) == true
  add_pet_to_customer(customers, pet)
  increase_pets_sold(pet_shop, 1)

  customers[:cash] -= pet[:price]
  pet_shop[:admin][:total_cash] += pet[:price]
end
end
