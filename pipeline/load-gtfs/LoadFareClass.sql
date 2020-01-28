INSERT INTO dbo.FareClass
(
    FareClassId,
	Price,
    CurrencyKey,
    PaymentMethodKey,
    TransferTypeKey,
    TransferDuration,
    AgencyKey
)
SELECT attr.fare_id,
       attr.price,
       cy.CurrencyKey,
       pm.PaymentMethodKey,
       trantyp.TransferTypeKey,
	   attr.transfer_duration,
       ag.AgencyKey
FROM gtfs.FareAttributes attr
JOIN dbo.Currency cy
ON cy.CurrencyId = attr.currency_type
JOIN dbo.PaymentMethod pm
ON pm.PaymentMethodId = attr.payment_method
JOIN dbo.Agency ag
ON ag.AgencyId = attr.agency_id
JOIN dbo.TransferType trantyp
ON trantyp.TransferTypeId = attr.transfers