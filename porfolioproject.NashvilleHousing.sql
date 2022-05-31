select *
from portfolioproject.dbo.NashvilleHousing 


select *
from portfolioproject.dbo.NashvilleHousing
order by ParcelID asc


select SaleDateconverted,convert(date,SaleDate)
from portfolioproject.dbo.NashvilleHousing

update portfolioproject.dbo.NashvilleHousing
set SaleDate=convert(date,SaleDate)  


ALTER TABLE portfolioproject.dbo.NashvilleHousing
Add saleDateconverted date;  

update portfolioproject.dbo.NashvilleHousing
SET SaleDateconverted = convert(date,SaleDate) 


select*
from portfolioproject.dbo.NashvilleHousing
where PropertyAddress is null
order by ParcelID

select Nash.ParcelID,Nash.PropertyAddress,ville.ParcelID,ville.PropertyAddress,ISNULL(Nash.propertyAddress,ville.
propertyAddress)
from portfolioproject.dbo.NashvilleHousing Nash
join portfolioproject.dbo.NashvilleHousing ville
 on Nash.ParcelID = ville.ParcelID
 and Nash.[UniqueID ]<>ville.[UniqueID ]
 where Nash.PropertyAddress is null


 UPDATE Nash
 SET PropertyAddress=ISNULL(Nash.propertyAddress,ville.propertyAddress)
from portfolioproject.dbo.NashvilleHousing Nash
join portfolioproject.dbo.NashvilleHousing ville
 on Nash.ParcelID = ville.ParcelID
 and Nash.[UniqueID ]<>ville.[UniqueID ]
where Nash.PropertyAddress is null



select 
SUBSTRING(propertyAddress,1,CHARINDEX(',',PropertyAddress)-1)as Address
, SUBSTRING(propertyAddress,CHARINDEX(',',PropertyAddress)+1, LEN (PropertyAddress)) as Address
from portfolioproject.dbo.NashvilleHousing

ALTER TABLE portfolioproject.dbo.Nashvillehousing 
ADD propertysplitAddress Nvarchar(255);
 
update portfolioproject.dbo.NashvilleHousing
SET propertysplitAddress=SUBSTRING(propertyAddress,1,CHARINDEX(',',PropertyAddress)-1)

ALTER TABLE portfolioproject.dbo.Nashvillehousing
ADD propertysplitcity Nvarchar(255);

update portfolioproject.dbo.NashvilleHousing
SET propertysplitcity=SUBSTRING(propertyAddress,CHARINDEX(',',PropertyAddress)+1, LEN (PropertyAddress)) 

Select 
parsename(Replace(ownerAddress,',','.'),3),
parsename(Replace(ownerAddress,',','.'),2),
parsename(Replace(ownerAddress,',','.'),1)
from portfolioproject.dbo.Nashvillehousing

ALTER TABLE portfolioproject.dbo.Nashvillehousing 
ADD ownersplitAddress Nvarchar(255);
 
update portfolioproject.dbo.NashvilleHousing
SET ownersplitAddress=parsename(Replace(ownerAddress,',','.'),3)

ALTER TABLE portfolioproject.dbo.Nashvillehousing
ADD ownersplitcity Nvarchar(255);

update portfolioproject.dbo.NashvilleHousing
SET ownersplitcity=parsename(Replace(ownerAddress,',','.'),2)

ALTER TABLE portfolioproject.dbo.Nashvillehousing
ADD ownersplitstate Nvarchar(255);

update portfolioproject.dbo.NashvilleHousing
SET ownersplitstate=parsename(Replace(ownerAddress,',','.'),1)




select distinct (soldasvacant),count (soldasvacant)
from  portfolioproject.dbo.NashvilleHousing
group by soldasvacant
order by 2


select soldasvacant
,case when soldasvacant='Y' then 'YES'
      when soldasvacant='N' then 'NO'
	  else soldasvacant 
	  ENd
from  portfolioproject.dbo.NashvilleHousing

update portfolioproject.dbo.NashvilleHousing
set SoldAsVacant=case when soldasvacant='Y' then 'YES'
      when soldasvacant='N' then 'NO'
	  else soldasvacant 
	  ENd


with rownumCTE as (
select *,
ROW_NUMBER()over ( 
 partition by parcelID,
              propertyAddress,
			  saleprice,
			  saledate,
			  legalReference
              order by 
			  uniqueID)row_num

from  portfolioproject.dbo.NashvilleHousing
)
--order by ParcelID
select*
from rownumCTE
where row_num > 1
--order by PropertyAddress


select *
from  portfolioproject.dbo.NashvilleHousing 


alter table  portfolioproject.dbo.NashvilleHousing 
drop column ownerAddress,propertyAddress,saleDate