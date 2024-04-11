
--Connect to Database 'AdventureWorksDW2019'
USE AdventureWorksDW2019;

select * from FactResellerSales
order by SalesOrderNumber;

select * from FactInternetSales
order by SalesOrderNumber;

-- View: Fact Sales;
SELECT 
	SalesOrderNumber,
	ProductKey,
	CustomerKey,
	SalesTerritoryKey,
	UnitPrice,
	OrderQuantity,
	ExtendedAmount,
	ProductStandardCost,
	TotalProductCost,
	SalesAmount,
	TaxAmt,
	Freight,
	OrderDate,
	DueDate,
	ShipDate
FROM FactInternetSales
ORDER BY 1;



-- View: Dimension Customers;
SELECT 
	CustomerKey,
	GeographyKey,
	FirstName,
	LastName,
	BirthDate,
	MaritalStatus,
	Gender,
	YearlyIncome,
	TotalChildren,
	EnglishEducation,
	EnglishOccupation,
	DateFirstPurchase,
	CommuteDistance,
	NumberCarsOwned,
	HouseOwnerFlag
FROM DimCustomer
ORDER BY 2;



-- View: Dimension Products;
SELECT 
	ProductKey,
	ProductSubcategoryKey,
	ProductAlternateKey,
	EnglishProductName,
	StandardCost,
	Color,
	LargePhoto
FROM DimProduct
ORDER BY 2;


SELECT 
	ProductSubcategoryKey,
	ProductCategoryKey,
	EnglishProductSubcategoryName
FROM DimProductSubcategory
ORDER BY 2;


SELECT 
	ProductCategoryKey,
	EnglishProductCategoryName
FROM DimProductCategory;

SELECT 
	DP.ProductKey,
	DP.ProductAlternateKey,
	DP.EnglishProductName,
	DP.StandardCost,
	DP.Color,
	DP.LargePhoto,
	DS.ProductSubcategoryKey,
	DS.EnglishProductSubcategoryName,
	DC.ProductCategoryKey,
	DC.EnglishProductCategoryName
FROM DimProduct DP
LEFT JOIN DimProductSubcategory DS
	ON DP.ProductSubcategoryKey = DS.ProductSubcategoryKey
LEFT JOIN DimProductCategory DC
	ON DS.ProductCategoryKey = DC.ProductCategoryKey
ORDER BY 1;



-- View: Dimension Location;
SELECT 
	SalesTerritoryKey,
	SalesTerritoryGroup,
	SalesTerritoryCountry,
	SalesTerritoryRegion
FROM DimSalesTerritory
ORDER BY 1;

DELETE FROM DimSalesTerritory
WHERE SalesTerritoryKey = 11;

SELECT 
	GeographyKey,
	SalesTerritoryKey,
	CountryRegionCode,
	StateProvinceName,
	StateProvinceCode,
	City,
	PostalCode,
	IpAddressLocator
FROM DimGeography 
ORDER BY 2;

SELECT 
	DT.SalesTerritoryKey,
	DG.GeographyKey,
	DT.SalesTerritoryGroup,
	DT.SalesTerritoryCountry,
	DT.SalesTerritoryRegion,
	DG.CountryRegionCode,
	DG.StateProvinceName,
	DG.StateProvinceCode,
	DG.City,
	DG.PostalCode,
	DG.IpAddressLocator
FROM DimSalesTerritory DT
RIGHT JOIN DimGeography DG
	ON DT.SalesTerritoryKey = DG.SalesTerritoryKey
ORDER BY 2;

