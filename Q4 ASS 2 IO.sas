*	AU_IO
	Routine to read the 2004 Australian Input Output data set into SAS.
;
	Title 2004 Australian IO Table ;
	filename csvFile url 
	"https://www.online.fbe.unimelb.edu.au/t_drive/ECOM/ECOM90020/data/IO_tables_2004.csv" 
	termstr=crlf;

	proc import datafile=csvFile out=flows replace dbms=csv; run;
	
*
	Add lables for each variable
;
	data flows ; set flows ; 
	sec_id = _n_ ; 
	label 
	c0101 = Sheep
	c0102 = Grains
	c0103 = Beef cattle
	c0104 = Dairy cattle
	c0105 = Pigs
	c0106 = Poultry
	c0107 = Other agriculture
	c0200 = Services to agriculture, hunting and trapping
	c0300 = Forestry and logging
	c0400 = Commercial fishing
	c1101 = Coal
	c1201 = Oil and gas
	c1301 = Iron ores
	c1302 = Non-ferrous metal ores
	c1400 = Other mining
	c1500 = Services to mining
	c2101 = Meat and meat products
	c2102 = Dairy products
	c2103 = Fruit and vegetable products
	c2104 = Oils and fats
	c2105 = Flour mill products and cereal foods
	c2106 = Bakery products
	c2107 = Confectionery
	c2108 = Other food products
	c2109 = Soft drinks, cordials and syrups
	c2110 = Beer and malt
	c2113 = Wine, spirits and tobacco products
	c2201 = Textile fibres, yarns and woven fabrics
	c2202 = Textile products
	c2203 = Knitting mill products
	c2204 = Clothing
	c2205 = Footwear
	c2206 = Leather and leather products
	c2301 = Sawmill products
	c2302 = Other wood products
	c2303 = Pulp, paper and paperboard
	c2304 = Paper containers and products
	c2401 = Printing and services to printing
	c2402 = Publishing, recorded media, etc.
	c2501 = Petroleum and coal products
	c2502 = Basic chemicals
	c2503 = Paints
	c2504 = Medicinal and pharmaceutical products, pesticides
	c2505 = Soap and detergents
	c2506 = Cosmetics and toiletry preparations
	c2507 = Other chemical products
	c2508 = Rubber products
	c2509 = Plastic products
	c2601 = Glass and glass products
	c2602 = Ceramic products
	c2603 = Cement, lime and concrete slurry
	c2604 = Plaster and other concrete products
	c2605 = Other non-metallic mineral products
	c2701 = Iron and steel
	c2702 = Basic non-ferrous metal and products
	c2703 = Structural metal products
	c2704 = Sheet metal products
	c2705 = Fabricated metal products
	c2801 = Motor vehicles and parts, other transport equipment
	c2802 = Ships and boats
	c2803 = Railway equipment
	c2804 = Aircraft
	c2805 = Photographic and scientific equipment
	c2806 = Electronic equipment
	c2807 = Household appliances
	c2808 = Other electrical equipment
	c2809 = Agricultural, mining, etc. machinery
	c2810 = Other machinery and equipment
	c2901 = Prefabricated buildings
	c2902 = Furniture
	c2903 = Other manufacturing
	c3601 = Electricity supply
	c3602 = Gas supply
	c3701 = Water supply, sewerage and drainage services
	c4101 = Residential building
	c4102 = Other construction
	c4201 = Construction trade services
	c4501 = Wholesale trade
	c4502 = Wholesale mechanical repairs
	c4503 = Other wholesale repairs
	c5101 = Retail trade
	c5102 = Retail mechanical repairs
	c5103 = Other retail repairs
	c5701 = Accommodation, cafes and restaurants
	c6101 = Road transport
	c6201 = Rail, pipeline and other transport
	c6301 = Water transport
	c6401 = Air and space transport
	c6601 = Services to transport, storage
	c7101 = Communication services
	c7301 = Banking
	c7302 = Non-bank finance
	c7401 = Insurance
	c7501 = Services to finance, investment and insurance
	c7701 = Ownership of dwellings
	c7702 = Other property services
	c7801 = Scientific research, technical and computer services
	c7802 = Legal, accounting, marketing and business management services
	c7803 = Other business services
	c8101 = Government administration
	c8201 = Defence
	c8401 = Education
	c8601 = Health services
	c8701 = Community services
	c9101 = Motion picture, radio and television services
	c9201 = Libraries, museums and the arts
	c9301 = Sport, gambling and recreational services
	c9501 = Personal services
	c9601 = Other services
	T4 = Industry Uses 
	Q1 = Households
	Q2 = Government
	Q3 = Private
	Q4 = Public Enterprise
	Q5 = General Government
	Q6 = Inventories
	Q7 = Exports
	T5 = (Q1 to Q7)
	T6 = Supply
	FT_E = Full-time Employees
	PT_E = Part-time Employees
	FTE_E = Full-time equivalent Employees
	FT_P = Full-time Persons Employed 
	PT_P = Part-time Persons Employed
	FTE_P = Full-time equivalent Persons Employed

	;

	run; 
 *
	Create a format to label the rows of the data
 ;
	proc format ; value sector 
	1 = 'c0101 Sheep                                                           '
	2 = 'c0102 Grains'
	3 = 'c0103 Beef cattle'
	4 = 'c0104 Dairy cattle'
	5 = 'c0105 Pigs'
	6 = 'c0106 Poultry'
	7 = 'c0107 Other agriculture'
	8 = 'c0200 Services to agriculture, hunting and trapping'
	9 = 'c0300 Forestry and logging'
	10 = 'c0400 Commercial fishing'
	11 = 'c1101 Coal'
	12 = 'c1201 Oil and gas'
	13 = 'c1301 Iron ores'
	14 = 'c1302 Non-ferrous metal ores'
	15 = 'c1400 Other mining'
	16 = 'c1500 Services to mining'
	17 = 'c2101 Meat and meat products'
	18 = 'c2102 Dairy products'
	19 = 'c2103 Fruit and vegetable products'
	20 = 'c2104 Oils and fats'
	21 = 'c2105 Flour mill products and cereal foods'
	22 = 'c2106 Bakery products'
	23 = 'c2107 Confectionery'
	24 = 'c2108 Other food products'
	25 = 'c2109 Soft drinks, cordials and syrups'
	26 = 'c2110 Beer and malt'
	27 = 'c2113 Wine, spirits and tobacco products'
	28 = 'c2201 Textile fibres, yarns and woven fabrics'
	29 = 'c2202 Textile products'
	30 = 'c2203 Knitting mill products'
	31 = 'c2204 Clothing'
	32 = 'c2205 Footwear'
	33 = 'c2206 Leather and leather products'
	34 = 'c2301 Sawmill products'
	35 = 'c2302 Other wood products'
	36 = 'c2303 Pulp, paper and paperboard'
	37 = 'c2304 Paper containers and products'
	38 = 'c2401 Printing and services to printing'
	39 = 'c2402 Publishing, recorded media, etc.'
	40 = 'c2501 Petroleum and coal products'
	41 = 'c2502 Basic chemicals'
	42 = 'c2503 Paints'
	43 = 'c2504 Medicinal and pharmaceutical products, pesticides'
	44 = 'c2505 Soap and detergents'
	45 = 'c2506 Cosmetics and toiletry preparations'
	46 = 'c2507 Other chemical products'
	47 = 'c2508 Rubber products'
	48 = 'c2509 Plasticproducts'
	49 = 'c2601 Glass and glass products'
	50 = 'c2602 Ceramicproducts'
	51 = 'c2603 Cement, lime and concrete slurry'
	52 = 'c2604 Plaster and other concrete products'
	53 = 'c2605 Other non-metallic mineral products'
	54 = 'c2701 Iron and steel'
	55 = 'c2702 Basic non-ferrous metal and products'
	56 = 'c2703 Structural metal products'
	57 = 'c2704 Sheet metal products'
	58 = 'c2705 Fabricated metal products'
	59 = 'c2801 Motor vehicles and parts, other transport equipment'
	60 = 'c2802 Ships and boats'
	61 = 'c2803 Railway equipment'
	62 = 'c2804 Aircraft'
	63 = 'c2805 Photographic and scientific equipment'
	64 = 'c2806 Electronic equipment'
	65 = 'c2807 Household appliances'
	66 = 'c2808 Other electrical equipment'
	67 = 'c2809 Agricultural, mining, etc. machinery'
	68 = 'c2810 Other machinery and equipment'
	69 = 'c2901 Prefabricated buildings'
	70 = 'c2902 Furniture'
	71 = 'c2903 Other manufacturing'
	72 = 'c3601 Electricity supply'
	73 = 'c3602 Gas supply'
	74 = 'c3701 Water supply, sewerage and drainage services'
	75 = 'c4101 Residential building'
	76 = 'c4102 Other construction'
	77 = 'c4201 Construction trade services'
	78 = 'c4501 Wholesale trade'
	79 = 'c4502 Wholesale mechanical repairs'
	80 = 'c4503 Other wholesale repairs'
	81 = 'c5101 Retail trade'
	82 = 'c5102 Retail mechanical repairs'
	83 = 'c5103 Other retail repairs'
	84 = 'c5701 Accommodation, cafes and restaurants'
	85 = 'c6101 Road transport'
	86 = 'c6201 Rail, pipeline and other transport'
	87 = 'c6301 Water transport'
	88 = 'c6401 Air and space transport'
	89 = 'c6601 Services to transport, storage'
	90 = 'c7101 Communication services'
	91 = 'c7301 Banking'
	92 = 'c7302 Non-bank finance'
	93 = 'c7401 Insurance'
	94 = 'c7501 Services to finance, investment and insurance'
	95 = 'c7701 Ownership of dwellings'
	96 = 'c7702 Other property services'
	97 = 'c7801 Scientificresearch, technical and computer services'
	98 = 'c7802 Legal, accounting, marketing and business management services'
	99 = 'c7803 Other business services'
	100 = 'c8101 Government administration'
	101 = 'c8201 Defence'
	102 = 'c8401 Education'
	103 = 'c8601 Health services'
	104 = 'c8701 Community services'
	105 = 'c9101 Motion picture, radio and television services'
	106 = 'c9201 Libraries, museums and the arts'
	107 = 'c9301 Sport, gambling and recreational services'
	108 = 'c9501 Personal services'
	109 = 'c9601 Other services'

;
run; 

*
		Create a data set of the interindustry flows only
; 
	data inter; set flows ; 
	if _n_ < 110 ; * use only the first 109 observations ; 
	keep c0101--c9601;  run; 
*
		Create a data set of the final demand for each sector and total output
; 
	data final; set flows ; 
	if _n_ < 110 ; * use only the first 109 observations ; 
	keep t5 t6 ; 

*
		Create a data set of the full-time equivalent employees
; 
	data fte ; set flows ; 
	if _n_ < 110 ; * use only the first 109 obs (the rest are missing for this ); 
	keep fte_e ; 
	run;

*
		Read the flow table into IML and create the matrix of technical Coefficients
;
	options ps=150 center ; 

	Proc IML ; 
	use inter ; 
	read all  into X ; * the inter industry flow matrix ; 

	use final ; 
	read all  into f ; 

	tt = f[,2];  * the total output is the 2nd column of f; 
	fd = f[,1];  * the final demand is the 1st column of f;  

	use fte ; 
	read all into emp ; 
	nsector = nrow(x) ;  * Define the number of sectors ; 
	s_id = (1:nsector)` ; * Define a vector to label the sectors ; 
*
	Create the technology matrix
;
     a = x * diag(1/tt) ; *  post multiply by the diagonal matrix of the inverses; 
*
	Print out the first ten rows and columns to check on the result
;
	print "First 10 rows and columns of technology matrix" ,
	(s_id[1:10]) [format=sector.] (x[1:10,1:10]), (tt[1:10]), (a[1:10,1:10]) ; 
*
	Compute the Leontief inverse matrix
;
	li_a = inv( i( nsector ) - a ) ;  * use the function i() to generate an identity matrix ; 
*
	Print out the first ten rows and columns of the Leontief inverse to check on the result
;
	print "First 10 rows and columns of Leontief Inverse matrix" ,
	(s_id[1:10]) [format=sector.], (li_a[1:10,1:10]) ; 
*
	Compute the average number of FTE Employees per $million of output and print the first
	10 rows
;
	r = emp/tt ; 
	print "Average number of FTE Employees per $million of output" ,
	(s_id[1:10]) [format=sector.], (r[1:10,1]) ;
 *
	Estimate the impact of a %change in the demand for output of sectors listed
	in vector nn with the proportional changes used in p_change 
 ;
	*nn = {84 81 }			 The number of the sector to change  		   *******;
	*p_change = {-1.00 -.50 }  the proportional changes                      *******; 

	nn = (1:109);

	print nn;

	p_change = j(1,10,-9.5) || j(1,6,-2.9)  || j(1,55,-4.1) || j(1,3,-0.2) || j(1,3,-6.4) || j(1,3,-4.4) ||
			   j(1,3,-6.8) || j(1,1,-33.4)  || j(1,5,-3) || j(1,1,-6.5) || j(1,4,-1) || j(1,2,-11) || j(1,2,-5.6) ||
			   j(1,1,-10) || j(1,2,-5.1) || j(1,1,-2) || j(1,2,-2.9) || j(1,4,-27) || j(1,1,-12)    ;
	p_change = p_change/100;
	b = ncol(p_change);

	print b ;
	print 'p_change' p_change;

	ncase = ncol(nn) ; 

	ff = j(nsector,1,0) ; 
	ff[nn,1] = fd[nn,1]#p_change` ; * define the proportion of output fall ; 
	
	
	nx = li_a * ff ;  * compute the change in the output vector ; 
	tot_nx = nx[nn,1] ; * select the industries for the total impact of the change ; 
	tot_all = sum(nx) ; * Total change in output over all sectors ; 
	tot_emp = sum(nx#r) ; * compute the total impact of the change in employment ;
	sec_emp = r[nn,]#ff[nn,1] ; * sector level results for employment changes ; 

	print / "Value of Impacts in $1,000" ; 
	print  "Impact of " (100#p_change`) "% change of:" ,
	 (nn`) [format=sector.] (ff[nn,1]); 
	print "Total Sector Impact of " , (nn`) [format=sector.] (tot_nx) , 
	"With an economy wide impact of" ,  (sum(nx) ); 

	print / "Impacts in number of Employees" ; 
	print "Direct number of Employees Sector Impact of " ,(nn`) [format=sector.]  (sec_emp),
		 "Total indirect impact of " (( nx#r )[nn,1]) ,
		"With the total Direct Employee impact of", (sum(sec_emp)); 
	print "Economy Wide number of Employees Impact of " , tot_emp; 
	Print "Thus, for every 1 job loss in these industries there are" 
	( 1 -(tot_emp/(sum(sec_emp))))" additional job losses over all. " ;
		
	  quit;
	  run; 


	options ; 
