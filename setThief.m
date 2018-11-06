function[string] = setThief(sus1, sus2, sus3, sus4)

vec1 = [];
vec1(1) = all(sus1 == sus2);
vec1(2) = all(sus1 == sus3);
vec1(3) = all(sus1 == sus4);

vec2 = [];
vec2(1) = all(sus2 == sus1);
vec2(2) = all(sus2 == sus3);
vec2(3) = all(sus2 == sus4);

vec3 = [];
vec3(1) = all(sus3 == sus1);
vec3(2) = all(sus3 == sus2);
vec3(3) = all(sus3 == sus4);

vec4 = [];
vec4(1) = all(sus4 == sus1);
vec4(2) = all(sus4 == sus2);
vec4(3) = all(sus4 == sus3);

summ1 = sum(vec1);
summ2 = sum(vec2);
summ3 = sum(vec3);
summ4 = sum(vec4);

sumvec = [summ1, summ2, summ3, summ4];
zero = find(sumvec == 0);
thief = zero; 

string = sprintf('Suspect #%d leaked the set list.', thief);

end