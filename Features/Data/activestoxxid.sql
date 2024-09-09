DECLARE @securityDate INT = {};
SELECT DISTINCT STOXXID FROM VENDOR.securityMapping as a
	join vendor.vendorInfo as b  on a.vendorId = b.id
WHERE b.[name] in ('iss', 'iss-dp') AND VF<=@securityDate AND VT>@securityDate and stoxxId !=''