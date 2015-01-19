%%%%%%%%%%%%% data analysis%%%%%%%%%%%%
%Y[:,1] y:>50K=1, <=50K=0
%X[:,1] age:number already
%X[:,2] workclass: Private£½0, Self-emp-not-inc£½1, Self-emp-inc£½2,
%       Federal-gov=3,Local-gov=4,State-gov=5,Without-pay=6,Never-worked=7
%X[:,3] fnlwht:number already
%X[:,4] education: Bachelors=0, Some-college=1, 11th=2, HS-grad=3, 
%       Prof-school=4, Assoc-acdm=5, Assoc-voc=6, 9th=7, 7th-8th=8, 
%       12th=9, Masters=10, 1st-4th=11, 10th=12, Doctorate=13, 5th-6th=14,
%       Preschool=15
%X[:,5] education-num: number already
%X[:,6] marital-status: Married-civ-spouse=0, Divorced=1, Never-married=2,
%       Separated=3,Widowed=4,Married-spouse-absent=5,Married-AF-spouse=6
%X[:,7] occupation: Tech-support=0, Craft-repair=1, Other-service=2, 
%       Sales=3, Exec-managerial=4, Prof-specialty=5, Handlers-cleaners=6,
%       Machine-op-inspct=7, Adm-clerical=8, Farming-fishing=9, 
%       Transport-moving=10, Priv-house-serv=11, Protective-serv=12, 
%       Armed-Forces=13
%X[:,8] relationship: Wife=0, Own-child=1, Husband=2, Not-in-family=3, 
%       Other-relative=4, Unmarried=5
%X[:,9] race: White=0, Asian-Pac-Islander=1, Amer-Indian-Eskimo=2, Other=3,
%       Black=4
%X[:,10]sex: Female=0, Male=1
%X[:,11]capital-gain:number already
%X[:,12]capital-loss:number already
%X[:,13]hours-per-week:number already
%X[:,14]native-country: United-States=0,Cambodia=1,England=2,Puerto-Rico=3,
%       Canada=4, Germany=5, Outlying-US(Guam-USVI-etc)=6, India=7,Japan=8,
%       Greece=9, South=10, China=11, Cuba=12, Iran=13, Honduras=14, 
%       Philippines=15, Italy=16, Poland=17, Jamaica=18, Vietnam=19, 
%       Mexico=20, Portugal=21,Ireland=22,France=23,Dominican-Republic=24,
%       Laos=25, Ecuador=26, Taiwan=27, Haiti=28, Columbia=29, Hungary=30,
%       Guatemala=31, Nicaragua=32, Scotland=33, Thailand=34,Yugoslavia=35, 
%       El-Salvador=36, Trinadad&Tobago=37, Peru=38, Hong=39, 
%       Holand-Netherlands=40
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[age workclass fnlwht education edunum mar_sta occupation relation race sex cap_gain cap_loss hour_week nat_country salary]=textread('adult.data','%f%s%f%s%f%s%s%s%s%s%f%f%f%s%s','delimiter',',');

for i=1:32561
    switch workclass{i}
        case 'Private'
            workclass{i}=0;
        case 'Self-emp-not-inc'
            workclass{i}=1;
        case 'Self-emp-inc'
            workclass{i}=2;
        case 'Federal-gov'
            workclass{i}=3;
        case 'Local-gov'
            workclass{i}=4;
        case 'State-gov'
            workclass{i}=5;
        case 'Without-pay'
            workclass{i}=6;
        case 'Never-worked'
            workclass{i}=7;
        case '?'
            workclass{i}=NaN;
    end
    
    switch education{i}
        case 'Bachelors'
            education{i}=0;
        case 'Some-college'
            education{i}=1;
        case '11th'
            education{i}=2;
        case 'HS-grad'
            education{i}=3;
        case 'Prof-school'
            education{i}=4;
        case 'Assoc-acdm'
            education{i}=5;
        case 'Assoc-voc'
            education{i}=6;
        case '9th'
            education{i}=7;
        case '7th-8th'
            education{i}=8;
        case '12th'
            education{i}=9;
        case 'Masters'
            education{i}=10;
        case '1st-4th'
            education{i}=11;
        case '10th'
            education{i}=12;
        case 'Doctorate'
            education{i}=13;
        case '5th-6th'
            education{i}=14;
        case 'Preschool'
            education{i}=15;
        case '?'
            education{i}=NaN;
    end
    
    switch mar_sta{i}
        case 'Married-civ-spouse'
            mar_sta{i}=0;
        case 'Divorced'
            mar_sta{i}=1;
        case 'Never-married'
            mar_sta{i}=2;
        case 'Separated'
            mar_sta{i}=3;
        case 'Widowed'
            mar_sta{i}=4;
        case 'Married-spouse-absent'
            mar_sta{i}=5;
        case 'Married-AF-spouse'
            mar_sta{i}=6;
        case '?'
            mar_sta{i}=NaN;
    end
    
    switch occupation{i}
        case 'Tech-support'
            occupation{i}=0;
        case 'Craft-repair'
            occupation{i}=1;
        case 'Other-service'
            occupation{i}=2;
        case 'Sales'
            occupation{i}=3;
        case 'Exec-managerial'
            occupation{i}=4;
        case 'Prof-specialty'
            occupation{i}=5;
        case 'Handlers-cleaners'
            occupation{i}=6;
        case 'Machine-op-inspct'
            occupation{i}=7;
        case 'Adm-clerical'
            occupation{i}=8;
        case 'Farming-fishing'
            occupation{i}=9;
        case 'Transport-moving'
            occupation{i}=10;
        case 'Priv-house-serv'
            occupation{i}=11;
        case 'Protective-serv'
            occupation{i}=12;
        case 'Armed-Forces'
            occupation{i}=13;
        case '?'
            occupation{i}=NaN;
    end
    
    switch relation{i}
        case 'Wife'
            relation{i}=0;
        case 'Own-child'
            relation{i}=1;
        case 'Husband'
            relation{i}=2;
        case 'Not-in-family'
            relation{i}=3;
        case 'Other-relative'
            relation{i}=4;
        case 'Unmarried'
            relation{i}=5;
        case '?'
            relation{i}=NaN;
    end
    
    switch race{i}
        case 'White'
            race{i}=0;
        case 'Asian-Pac-Islander'
            race{i}=1;
        case 'Amer-Indian-Eskimo'
            race{i}=2;
        case 'Other'
            race{i}=3;
        case 'Black'
            race{i}=4;
        case '?'
            race{i}=NaN;
    end
    
    switch sex{i}
        case 'Female'
            sex{i}=0;
        case 'Male'
            sex{i}=1;
        case '?'
            sex{i}=NaN;
    end
    
    switch nat_country{i}
        case 'United-States'
            nat_country{i}=0;
        case 'Cambodia'
            nat_country{i}=1;
        case 'England'
            nat_country{i}=2;
        case 'Puerto-Rico'
            nat_country{i}=3;
        case 'Canada'
            nat_country{i}=4;
        case 'Germany'
            nat_country{i}=5;
        case 'Outlying-US(Guam-USVI-etc)'
            nat_country{i}=6;
        case 'India'
            nat_country{i}=7;
        case 'Japan'
            nat_country{i}=8;
        case 'Greece'
            nat_country{i}=9;
        case 'South'
            nat_country{i}=10;
        case 'China'
            nat_country{i}=11;
        case 'Cuba'
            nat_country{i}=12;
        case 'Iran'
            nat_country{i}=13;
        case 'Honduras'
            nat_country{i}=14;
        case 'Philippines'
            nat_country{i}=15;
        case 'Italy'
            nat_country{i}=16;
        case 'Poland'
            nat_country{i}=17;
        case 'Jamaica'
            nat_country{i}=18;
        case 'Vietnam'
            nat_country{i}=19;
        case 'Mexico'
            nat_country{i}=20;
        case 'Portugal'
            nat_country{i}=21;
        case 'Ireland'
            nat_country{i}=22;
        case 'France'
            nat_country{i}=23;
        case 'Dominican-Republic'
            nat_country{i}=24;
        case 'Laos'
            nat_country{i}=25;
        case 'Ecuador'
            nat_country{i}=26;
        case 'Taiwan'
            nat_country{i}=27;
        case 'Haiti'
            nat_country{i}=28;
        case 'Columbia'
            nat_country{i}=29;
        case 'Hungary'
            nat_country{i}=30;
        case 'Guatemala'
            nat_country{i}=31;
        case 'Nicaragua'
            nat_country{i}=32;
        case 'Scotland'
            nat_country{i}=33;
        case 'Thailand'
            nat_country{i}=34;
        case 'Yugoslavia'
            nat_country{i}=35;
        case 'El-Salvador'
            nat_country{i}=36;
        case 'Trinadad&Tobago'
            nat_country{i}=37;
        case 'Peru'
            nat_country{i}=38;
        case 'Hong'
            nat_country{i}=39;
        case 'Holand-Netherlands'
            nat_country{i}=40;
        case '?'
            nat_country{i}=NaN;
    end
    
    switch salary{i}
        case '>50K'
            salary{i}=1;
        case '<=50K'
            salary{i}=0;
    end
        
end




[age1 workclass1 fnlwht1 education1 edunum1 mar_sta1 occupation1 relation1 race1 sex1 cap_gain1 cap_loss1 hour_week1 nat_country1 salary1]=textread('adult.test','%f%s%f%s%f%s%s%s%s%s%f%f%f%s%s','delimiter',',','headerlines',2);

for j=1:16280
    switch workclass1{j}
        case 'Private'
            workclass1{j}=0;
        case 'Self-emp-not-inc'
            workclass1{j}=1;
        case 'Self-emp-inc'
            workclass1{j}=2;
        case 'Federal-gov'
            workclass1{j}=3;
        case 'Local-gov'
            workclass1{j}=4;
        case 'State-gov'
            workclass1{j}=5;
        case 'Without-pay'
            workclass1{j}=6;
        case 'Never-worked'
            workclass1{j}=7;
        case '?'
            workclass1{j}=NaN;
    end
    
    switch education1{j}
        case 'Bachelors'
            education1{j}=0;
        case 'Some-college'
            education1{j}=1;
        case '11th'
            education1{j}=2;
        case 'HS-grad'
            education1{j}=3;
        case 'Prof-school'
            education1{j}=4;
        case 'Assoc-acdm'
            education1{j}=5;
        case 'Assoc-voc'
            education1{j}=6;
        case '9th'
            education1{j}=7;
        case '7th-8th'
            education1{j}=8;
        case '12th'
            education1{j}=9;
        case 'Masters'
            education1{j}=10;
        case '1st-4th'
            education1{j}=11;
        case '10th'
            education1{j}=12;
        case 'Doctorate'
            education1{j}=13;
        case '5th-6th'
            education1{j}=14;
        case 'Preschool'
            education1{j}=15;
        case '?'
            education1{j}=NaN;
    end
    
    switch mar_sta1{j}
        case 'Married-civ-spouse'
            mar_sta1{j}=0;
        case 'Divorced'
            mar_sta1{j}=1;
        case 'Never-married'
            mar_sta1{j}=2;
        case 'Separated'
            mar_sta1{j}=3;
        case 'Widowed'
            mar_sta1{j}=4;
        case 'Married-spouse-absent'
            mar_sta1{j}=5;
        case 'Married-AF-spouse'
            mar_sta1{j}=6;
        case '?'
            mar_sta1{j}=NaN;
    end
    
    switch occupation1{j}
        case 'Tech-support'
            occupation1{j}=0;
        case 'Craft-repair'
            occupation1{j}=1;
        case 'Other-service'
            occupation1{j}=2;
        case 'Sales'
            occupation1{j}=3;
        case 'Exec-managerial'
            occupation1{j}=4;
        case 'Prof-specialty'
            occupation1{j}=5;
        case 'Handlers-cleaners'
            occupation1{j}=6;
        case 'Machine-op-inspct'
            occupation1{j}=7;
        case 'Adm-clerical'
            occupation1{j}=8;
        case 'Farming-fishing'
            occupation1{j}=9;
        case 'Transport-moving'
            occupation1{j}=10;
        case 'Priv-house-serv'
            occupation1{j}=11;
        case 'Protective-serv'
            occupation1{j}=12;
        case 'Armed-Forces'
            occupation1{j}=13;
        case '?'
            occupation1{j}=NaN;
    end
    
    switch relation1{j}
        case 'Wife'
            relation1{j}=0;
        case 'Own-child'
            relation1{j}=1;
        case 'Husband'
            relation1{j}=2;
        case 'Not-in-family'
            relation1{j}=3;
        case 'Other-relative'
            relation1{j}=4;
        case 'Unmarried'
            relation1{j}=5;
        case '?'
            relation1{j}=NaN;
    end
    
    switch race1{j}
        case 'White'
            race1{j}=0;
        case 'Asian-Pac-Islander'
            race1{j}=1;
        case 'Amer-Indian-Eskimo'
            race1{j}=2;
        case 'Other'
            race1{j}=3;
        case 'Black'
            race1{j}=4;
        case '?'
            race1{j}=NaN;
    end
    
    switch sex1{j}
        case 'Female'
            sex1{j}=0;
        case 'Male'
            sex1{j}=1;
        case '?'
            sex1{j}=NaN;
    end
    
    switch nat_country1{j}
        case 'United-States'
            nat_country1{j}=0;
        case 'Cambodia'
            nat_country1{j}=1;
        case 'England'
            nat_country1{j}=2;
        case 'Puerto-Rico'
            nat_country1{j}=3;
        case 'Canada'
            nat_country1{j}=4;
        case 'Germany'
            nat_country1{j}=5;
        case 'Outlying-US(Guam-USVI-etc)'
            nat_country1{j}=6;
        case 'India'
            nat_country1{j}=7;
        case 'Japan'
            nat_country1{j}=8;
        case 'Greece'
            nat_country1{j}=9;
        case 'South'
            nat_country1{j}=10;
        case 'China'
            nat_country1{j}=11;
        case 'Cuba'
            nat_country1{j}=12;
        case 'Iran'
            nat_country1{j}=13;
        case 'Honduras'
            nat_country1{j}=14;
        case 'Philippines'
            nat_country1{j}=15;
        case 'Italy'
            nat_country1{j}=16;
        case 'Poland'
            nat_country1{j}=17;
        case 'Jamaica'
            nat_country1{j}=18;
        case 'Vietnam'
            nat_country1{j}=19;
        case 'Mexico'
            nat_country1{j}=20;
        case 'Portugal'
            nat_country1{j}=21;
        case 'Ireland'
            nat_country1{j}=22;
        case 'France'
            nat_country1{j}=23;
        case 'Dominican-Republic'
            nat_country1{j}=24;
        case 'Laos'
            nat_country1{j}=25;
        case 'Ecuador'
            nat_country1{j}=26;
        case 'Taiwan'
            nat_country1{j}=27;
        case 'Haiti'
            nat_country1{j}=28;
        case 'Columbia'
            nat_country1{j}=29;
        case 'Hungary'
            nat_country1{j}=30;
        case 'Guatemala'
            nat_country1{j}=31;
        case 'Nicaragua'
            nat_country1{j}=32;
        case 'Scotland'
            nat_country1{j}=33;
        case 'Thailand'
            nat_country1{j}=34;
        case 'Yugoslavia'
            nat_country1{j}=35;
        case 'El-Salvador'
            nat_country1{j}=36;
        case 'Trinadad&Tobago'
            nat_country1{j}=37;
        case 'Peru'
            nat_country1{j}=38;
        case 'Hong'
            nat_country1{j}=39;
        case 'Holand-Netherlands'
            nat_country1{j}=40;
        case '?'
            nat_country1{j}=NaN;
    end
    
    switch salary1{j}
        case '>50K.'
            salary1{j}=1;
        case '<=50K.'
            salary1{j}=0;
    end
        
end

education=cell2mat(education);
mar_sta=cell2mat(mar_sta);
nat_country=cell2mat(nat_country);
occupation=cell2mat(occupation);
race=cell2mat(race);
relation=cell2mat(relation);
salary=cell2mat(salary);
sex=cell2mat(sex);
workclass=cell2mat(workclass);
X=[age workclass fnlwht education edunum mar_sta occupation relation race sex cap_gain cap_loss hour_week nat_country];
Y=[salary];

bagtree = TreeBagger(150,X,Y,'oobpred','on');
ooberror=oobError(bagtree);
plot (ooberror);
xlabel('number of bag');
ylabel('oob error');


education1=cell2mat(education1);
mar_sta1=cell2mat(mar_sta1);
nat_country1=cell2mat(nat_country1);
occupation1=cell2mat(occupation1);
race1=cell2mat(race1);
relation1=cell2mat(relation1);
salary1=cell2mat(salary1);
sex1=cell2mat(sex1);
workclass1=cell2mat(workclass1);
X1=[age1 workclass1 fnlwht1 education1 edunum1 mar_sta1 occupation1 relation1 race1 sex1 cap_gain1 cap_loss1 hour_week1 nat_country1];
Y1=[salary1];

Y2=predict(bagtree,X1);
Y2=cell2mat(Y2);
Y2=str2num(Y2);
testerror=sum(abs(Y2-Y1))/16280


