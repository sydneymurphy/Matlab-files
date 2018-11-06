function[st] = halloweenParty(ca)
%Get out fieldnames from cell array & put them in a vector called fields
fields = [];
for x = ca(1:2:end)
    fields = [fields,x];
end
%Get out values from cell array & put them in a vector called values
values = [];
for y = ca(2:2:end)
    values = [values,y];
end
%Create the structure by assigning the values to the fieldnames
for a = 1:length(fields)
    st.(fields{a}) = values{a};
end

end
    
    