//
//  AutocompleteType.swift
//  Web
//
//  Created by Mihael Isaev on 20.12.2020.
//

import Foundation

public final class AutocompleteType {
    public let value: String
    
    public init (_ value: String) {
        self.value = value
    }
    
    /// The browser is not permitted to automatically enter or select a value for this field.
    /// It is possible that the document or application provides its own autocomplete feature,
    /// or that security concerns require that the field's value not be automatically entered.
    ///
    ///
    /// Note: In most modern browsers, setting autocomplete to "off"
    /// will not prevent a password manager from asking the user
    /// if they would like to save username and password information,
    /// or from automatically filling in those values in a site's login form.
    /// [See the autocomplete attribute and login fields.](https://developer.mozilla.org/en-US/docs/Web/Security/Securing_your_site/Turning_off_form_autocompletion#The_autocomplete_attribute_and_login_fields)
    public static var off: AutocompleteType { .init("off") }
    
    /// The browser is allowed to automatically complete the input.
    /// No guidance is provided as to the type of data expected in the field, so the browser may use its own judgement.
    public static var on: AutocompleteType { .init("on") }
    
    /// The field expects the value to be a person's full name.
    /// Using "name" rather than breaking the name down into its components
    /// is generally preferred because it avoids dealing with the wide diversity
    /// of human names and how they are structured;
    /// however, you can use the following autocomplete values
    /// if you do need to break the name down into its components
    public static var name: AutocompleteType { .init("name") }
    
    /// The prefix or title, such as "Mrs.", "Mr.", "Miss", "Ms.", "Dr.", or "Mlle."
    public static var honorificPrefix: AutocompleteType { .init("honorific-prefix") }
    
    /// The given (or "first") name.
    public static var givenName: AutocompleteType { .init("given-name") }
    
    /// The middle name.
    public static var additionalName: AutocompleteType { .init("additional-name") }
    
    /// The family (or "last") name.
    public static var familyName: AutocompleteType { .init("family-name") }
    
    /// The suffix, such as "Jr.", "B.Sc.", "PhD.", "MBASW", or "IV".
    public static var honorificSuffix: AutocompleteType { .init("honorific-suffix") }
    
    /// A nickname or handle.
    public static var nickname: AutocompleteType { .init("nickname") }
    
    /// An email address.
    public static var email: AutocompleteType { .init("email") }
    
    /// A username or account name.
    public static var username: AutocompleteType { .init("username") }
    
    /// A new password.
    /// When creating a new account or changing passwords, this should be used
    /// for an "Enter your new password" or "Confirm new password" field,
    /// as opposed to a general "Enter your current password" field that might be present.
    /// This may be used by the browser both to avoid accidentally filling in an existing password
    /// and to offer assistance in creating a secure password
    /// (see also [Preventing autofilling with autocomplete="new-password"](https://developer.mozilla.org/en-US/docs/Web/Security/Securing_your_site/Turning_off_form_autocompletion#Preventing_autofilling_with_autocompletenew-password)).
    public static var newPassword: AutocompleteType { .init("new-password") }
    
    /// The user's current password.
    public static var currentPassword: AutocompleteType { .init("current-password") }
    
    /// A one-time code used for verifying user identity.
    public static var oneTimeCode: AutocompleteType { .init("one-time-code") }
    
    /// A job title, or the title a person has within an organization,
    /// such as "Senior Technical Writer", "President", or "Assistant Troop Leader".
    public static var organizationTitle: AutocompleteType { .init("organization-title") }
    
    /// A company or organization name, such as "Acme Widget Company" or "Girl Scouts of America".
    public static var organization: AutocompleteType { .init("organization") }
    
    /// A street address.
    /// This can be multiple lines of text, and should fully identify the location
    /// of the address within its second administrative level (typically a city or town),
    /// but should not include the city name, ZIP or postal code, or country name.
    public static var streetAddress: AutocompleteType { .init("street-address") }

    /// Each individual line of the street address.
    /// These should only be present if the "street-address" is not present.
    public static var addressLine1: AutocompleteType { .init("address-line1") }
    
    /// Each individual line of the street address.
    /// These should only be present if the "street-address" is not present.
    public static var addressLine2: AutocompleteType { .init("address-line2") }
    
    /// Each individual line of the street address.
    /// These should only be present if the "street-address" is not present.
    public static var addressLine3: AutocompleteType { .init("address-line3") }
    
    /// The finest-grained administrative level, in addresses which have four levels.
    public static var addressLevel4: AutocompleteType { .init("address-level4") }
    
    /// The third administrative level, in addresses with at least three administrative levels.
    public static var addressLevel3: AutocompleteType { .init("address-level3") }
    
    /// The second administrative level, in addresses with at least two of them.
    /// In countries with two administrative levels,
    /// this would typically be the city, town, village, or other locality in which the address is located.
    public static var addressLevel2: AutocompleteType { .init("address-level2") }
    
    /// The first administrative level in the address.
    /// This is typically the province in which the address is located.
    /// In the United States, this would be the state.
    /// In Switzerland, the canton.
    /// In the United Kingdom, the post town.
    public static var addressLevel1: AutocompleteType { .init("address-level1") }
    
    /// A country or territory code.
    public static var country: AutocompleteType { .init("country") }
    
    /// A country or territory name.
    public static var countryName: AutocompleteType { .init("country-name") }
    
    /// A postal code (in the United States, this is the ZIP code).
    public static var postalCode: AutocompleteType { .init("postal-code") }
    
    /// The full name as printed on or associated with a payment instrument
    /// such as a credit card. Using a full name field is preferred,
    /// typically, over breaking the name into pieces.
    public static var ccName: AutocompleteType { .init("cc-name") }
    
    /// A given (first) name as given on a payment instrument like a credit card.
    public static var ccGivenName: AutocompleteType { .init("cc-given-name") }
    
    /// A middle name as given on a payment instrument or credit card.
    public static var ccAdditionalName: AutocompleteType { .init("cc-additional-name") }
    
    /// A family name, as given on a credit card.
    public static var ccFamilyName: AutocompleteType { .init("cc-family-name") }
    
    /// A credit card number or other number identifying a payment method, such as an account number.
    public static var ccNumber: AutocompleteType { .init("cc-number") }
    
    /// A payment method expiration date, typically in the form "MM/YY" or "MM/YYYY".
    public static var ccExp: AutocompleteType { .init("cc-exp") }
    
    /// The month in which the payment method expires.
    public static var ccExpMonth: AutocompleteType { .init("cc-exp-month") }
    
    /// The year in which the payment method expires.
    public static var ccExpYear: AutocompleteType { .init("cc-exp-year") }
    
    /// The security code for the payment instrument; on credit cards,
    /// this is the 3-digit verification number on the back of the card.
    public static var ccCsc: AutocompleteType { .init("cc-csc") }
    
    /// The type of payment instrument (such as "Visa" or "Master Card").
    public static var ccType: AutocompleteType { .init("cc-type") }
    
    /// The currency in which the transaction is to take place.
    public static var transactionCurrency: AutocompleteType { .init("transaction-currency") }
    
    /// The amount, given in the currency specified by "transaction-currency", of the transaction, for a payment form.
    public static var transactionAmount: AutocompleteType { .init("transaction-amount") }
    
    /// A preferred language, given as a valid BCP 47 language tag.
    public static var language: AutocompleteType { .init("language") }
    
    /// A birth date, as a full date.
    public static var bday: AutocompleteType { .init("bday") }
    
    /// The day of the month of a birth date.
    public static var bdayDay: AutocompleteType { .init("bday-day") }
    
    /// The month of the year of a birth date.
    public static var bdayMonth: AutocompleteType { .init("bday-month") }
    
    /// The year of a birth date.
    public static var bdayYear: AutocompleteType { .init("bday-year") }
    
    /// A gender identity (such as "Female", "Fa'afafine", "Male"), as freeform text without newlines.
    public static var sex: AutocompleteType { .init("sex") }
    
    /// A full telephone number, including the country code.
    /// If you need to break the phone number up into its components,
    /// you can use these values for those fields:
    public static var tel: AutocompleteType { .init("tel") }
    
    /// The country code, such as "1" for the United States, Canada,
    /// and other areas in North America and parts of the Caribbean.
    public static var telCountryCode: AutocompleteType { .init("tel-country-code") }
    
    /// The entire phone number without the country code component,
    /// including a country-internal prefix. For the phone number "1-855-555-6502",
    /// this field's value would be "855-555-6502".
    public static var telNational: AutocompleteType { .init("tel-national") }
    
    /// The area code, with any country-internal prefix applied if appropriate.
    public static var telAreaCode: AutocompleteType { .init("tel-area-code") }
    
    /// The phone number without the country or area code.
    /// This can be split further into two parts, for phone numbers
    /// which have an exchange number and then a number within the exchange.
    /// For the phone number "555-6502", use "tel-local-prefix" for "555" and "tel-local-suffix" for "6502".
    public static var telLocal: AutocompleteType { .init("tel-local") }
    
    /// A telephone extension code within the phone number,
    /// such as a room or suite number in a hotel or an office extension in a company.
    public static var telExtension: AutocompleteType { .init("tel-extension") }
    
    /// A URL for an instant messaging protocol endpoint, such as "xmpp:username@example.net".
    public static var impp: AutocompleteType { .init("impp") }
    
    /// A URL, such as a home page or company web site address
    /// as appropriate given the context of the other fields in the form.
    public static var url: AutocompleteType { .init("url") }
    
    /// The URL of an image representing the person, company,
    /// or contact information given in the other fields in the form.
    public static var photo: AutocompleteType { .init("photo") }
}
