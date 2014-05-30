function factorielle(n)
    if n == 0 then
        return 1 -- on renvoie la valeur 1 quand le paramètre vaut 0
    else
        return n * factorielle(n - 1)
    end
end
for index = 1,5 do
    print(index, "n! = ", factorielle(index))
end