class StaticPagesController < ApplicationController

  def home
  end

  def info
  end

  def calculator

    # images array
    @images = [nil,"section_carbohydrates.png","section_meat.png",nil,"section_proteins.png",nil,"section_drinks.png",nil]
    # calculator hash with questions, items' coefficients and slider options
    @items = {
      carbohydrates1: {
        pasta:  { value:1848, question:"How many dishes of pasta did you eat this week? (100g/dish)",
                  slider:{ id:"pasta", max:14 }
        },
        bread:  { value:40*7, question:"How many slices of bread did you eat normally every day this week? (30g/slice)",
                  slider:{ id:"bread", max:16 },
                  description:"Wheat consumes about 790.000 billion litres of water annually, which constitutes 12% of the global water use for crop poduction."
        }
      },
      carbohydrates2: {
        rice: { value:(3400.0/1000*90).round, question:"How many dishes of rice did you eat this week? (90g/dish)",
                slider:{ id:"rice", max:10 },
                description:"One kilogram of rice harvested from the field produce 0.67 kg of milled rice."
        },
        potatoes: { value:(287.0/1000*170).round, question:"How many potatoes did you eat this week?",
                slider:{ id:"potatoes", max:14 }
        }
      },
      meat: {
        beef: { value:4500, question:"How many beef steaks did you eat this week? (300g/steak)",
                slider:{ id:"beef", max:8 }
                #description:"It takes in average three years to produce 200 kg of beef. During that time, feeding the animals requires about 15300 litres of water."
        },
        pork: { value:1440, question:"How many pork steaks did you eat this week? (300g/steak)",
                slider:{ id:"pork", max:8 },
        },
        chicken: { value:1170, question:"How many portions of chicken did you eat this week? (300g/beastfilet)",
                slider:{ id:"chicken", max:10 },
                description:"These quantities are calculated based on the average water cost of feeding the animal and of servicing."
        }
      },
      vegetables: {
        vegetables: { value:(385.0/1000*150).round, question:"How many portions of vegetables did you eat this week? (150g/portion)",
                slider:{ id:"vegetables", max:20 },
                description:"Vegetables' water consumption is far less than meat's one. So eating lots of vegetables reduces your water footprint."
        }
      },
      proteins: {
        milk: { value:1000/4, question:"How many cups of milk did you drink this week? (250ml/cup)",
                slider:{ id:"milk", max:14 }
        },
        eggs: { value:196, question:"How many eggs did you eat this week?",
                slider:{ id:"eggs", max:10 }
        },
        cheese: { value:5, question:"How many grams of cheese did you eat this week?",
                slider:{ id:"cheese", max:1000 }
        }
      },
      drinks1: {
        wine: { value:720/2, question:"How many bottles of wine did you drink the last two weeks? (750ml/bottle)",
                slider:{ id:"wine", max:8 }
        },
        beer: { value:150/2, question:"How many bottles of beer did you drink the last two weeks? (500ml/bottle)",
                slider:{ id:"beer", max:16 }
        }
      },
      drinks2: {
        tea: { value:30, question:"How many cups of tea did you drink this week? (250ml/cup)",
                slider:{ id:"tea", max:16 }
        },
        coffee: { value:140, question:"How many cups of coffee did you drink this week? (150ml/cup)",
                slider:{ id:"coffee", max:30 }
        },
        sugar: { value:(1781.0/1000*44).round, question:"How many teaspoons of sugar did you use this week? (44g/teaspoon)",
                slider:{ id:"sugar", max:50 }
        }
      },
      clothes: {
        shoes: { value:8000/8, question:"How many pairs of leather shoes did you buy the last two months?",
                slider:{ id:"shoes", max:6 }
        },
        shirts: { value:2900/4, question:"How many t-shirts or shirts did you buy this month?",
                slider:{ id:"shirts", max:6 }
        },
        jeans: { value:8000/4, question:"How many pairs of jeans did you buy this month?",
                slider:{ id:"jeans", max:4 }
        }
      }
    }

  end

  # save test result in cookies, waiting for login or signup
  def save_result_in_cookies
    result = params.require(:static_page)[:result]

    # check result exists
    if result
      cookies[:result] = result
    end

    render :nothing => true
  end
end
