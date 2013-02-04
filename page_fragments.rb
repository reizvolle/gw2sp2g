# == description: Individual page fragments that will be used ny another template in order to construct the entire list

require 'erb'
require_relative 'mf_recipe'

def generic caption, recipeType
    template = %{
        <table>
            <caption><a name="<%= caption %>"><%= caption %></a></caption>
            <%= recipeType.table_header %>
            <% recipeType.each do | item |%>
                <%= recipeType.new(item).as_tr %>
            <% end %>
        </table>
    }

    ERB.new(template).result(binding)
end

def lodestones
    #generic("Lodestones", LodestoneRecipe)

    template = %{
        <table id="lodestones">
            <caption>Lodestones</caption>
            <%= LodestoneRecipe.table_header %>
            <% ["Charged", "Molten", "Crystal", "Destroyer", "Corrupted", "Onyx"].each do | lodestone |%>
                <% 5.downto(2).each do | i | %>
                    <%= LodestoneRecipe.new(lodestone, i).as_tr %>
                <% end %>
            <% end %>
        </table>
    }

    ERB.new(template).result(binding)
end

def dust
    template = %{
        <table id="common">
            <caption>Dust</caption>
            <%= CommonRecipe.table_header %>
            <% ["Dust" ].each do | mat |%>
                <% 6.downto(2).each do | i | %>
                    <%= DustRecipe.new(mat, i).as_tr %>
                <% end %>
            <% end %>
        </table>
    }

    ERB.new(template).result(binding)
end

def common_crafting_materials
    template = %{
        <table id="common">
            <caption>Common Crafting Materials</caption>
            <%= CommonRecipe.table_header %>
            <% ["Ore", "Cloth", "Wood", "Leather"].each do | mat |%>
                <% 6.downto(2).each do | i | %>
                    <%= CommonRecipe.new(mat, i).as_tr %>
                <% end %>
            <% end %>
        </table>
    }

    ERB.new(template).result(binding)
end

def fine_crafting_materials
    template = %{
        <table id="fine">
            <caption>Fine Crafting Materials</caption>
            <%= FineRecipe.table_header %>
            <% ["Bone", "Fang", "Claw", "Blood", "Totem", "Scale", "Venom"].each do | mat |%>
                <% 6.downto(2).each do | i | %>
                    <%= FineRecipe.new(mat, i).as_tr %>
                <% end %>
            <% end %>
        </table>
    }

    ERB.new(template).result(binding)
end

def gifts
    generic("Gifts", GiftRecipe)
end

def mystic_weapons
    generic("Mystic Weapons", MysticWeaponRecipe)
end

def mystic_forge_recipes
    generic("Mystic Forge Recipes", MysticForgeRecipe)
end

def pendants
    generic("Pendants", PendantRecipe)
end
