//
//  ARIA.swift
//  
//
//  Created by Mihael Isaev on 04.12.2022.
//

import Web

public struct ARIARoleType {
    let value: String
    
    init(value: String) {
        self.value = value
    }
    
    // MARK: - Document structure roles
    
    /// Document Structure roles are used to provide a structural description for a section of content.
    /// Most of these roles should no longer be used as browsers now support semantic HTML element with the same meaning.
    /// The roles without HTML equivalents, such as presentation, toolbar and tooltip roles,
    /// provide information on the document structure to assistive technologies
    /// such as screen readers as equivalent native HTML tags are not available.
    
    /// <#T##Result#>
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Roles/toolbar_role)
    public static var toolbar: ARIARoleType { .init(value: "toolbar") }
    
    /// <#T##Result#>
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Roles/tooltip_role)
    public static var tooltip: ARIARoleType { .init(value: "tooltip") }
    
    /// <#T##Result#>
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Roles/feed_role)
    public static var feed: ARIARoleType { .init(value: "feed") }
    
    /// <#T##Result#>
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Roles/math_role)
    public static var math: ARIARoleType { .init(value: "math") }
    
    /// <#T##Result#>
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Roles/presentation_role)
    public static var presentation: ARIARoleType { .init(value: "presentation") }
    
    /// <#T##Result#>
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Roles/none_role)
    public static var none: ARIARoleType { .init(value: "none") }
    
    /// <#T##Result#>
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Roles/note_role)
    public static var note: ARIARoleType { .init(value: "note") }
    
    /// <#T##Result#>
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Roles/application_role)
    public static var application: ARIARoleType { .init(value: "application") }
    
    /// <#T##Result#>
    ///
    /// (use `<article>`)
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Roles/article_role)
    public static var article: ARIARoleType { .init(value: "article") }
    
    /// <#T##Result#>
    ///
    /// (use `<td>`)
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Roles/cell_role)
    public static var cell: ARIARoleType { .init(value: "cell") }
    
    /// <#T##Result#>
    ///
    /// (use `<th scope="col">`)
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Roles/columnheader_role)
    public static var columnHeader: ARIARoleType { .init(value: "columnheader") }
    
    /// <#T##Result#>
    ///
    /// (use `<dfn>`)
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Roles/definition_role)
    public static var definition: ARIARoleType { .init(value: "definition") }
    
    /// <#T##Result#>
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Roles/directory_role)
    public static var directory: ARIARoleType { .init(value: "directory") }
    
    /// <#T##Result#>
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Roles/document_role)
    public static var document: ARIARoleType { .init(value: "document") }
    
    /// <#T##Result#>
    ///
    /// (use `<figure>` instead)
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Roles/figure_role)
    public static var figure: ARIARoleType { .init(value: "figure") }
    
    /// <#T##Result#>
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Roles/group_role)
    public static var group: ARIARoleType { .init(value: "group") }
    
    /// <#T##Result#>
    ///
    /// (use `<h1> thru <h6>`)
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Roles/heading_role)
    public static var heading: ARIARoleType { .init(value: "heading") }
    
    /// <#T##Result#>
    ///
    /// (use `<img>` or `<picture>` instead)
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Roles/img_role)
    public static var img: ARIARoleType { .init(value: "img") }
    
    /// <#T##Result#>
    ///
    /// (use either `<ul>` or `<ol>` instead)
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Roles/list_role)
    public static var list: ARIARoleType { .init(value: "list") }
    
    /// <#T##Result#>
    ///
    /// (use `<li>` instead)
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Roles/listitem_role)
    public static var listItem: ARIARoleType { .init(value: "listitem") }
    
    /// The meter role is used to identify an element being used as a meter.
    ///
    /// (use `<meter>` instead)
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Roles/meter_role)
    public static var meter: ARIARoleType { .init(value: "meter") }
    
    /// An element with role="row" is a row of cells within a tabular structure.
    /// A row contains one or more cells, grid cells or column headers, and possibly a row header,
    /// within a grid, table or treegrid, and optionally within a rowgroup.
    ///
    /// (use the `<tr>` with `<table>`)
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Roles/row_role)
    public static var row: ARIARoleType { .init(value: "row") }
    
    /// An element with role="rowgroup" is a group of rows within a tabular structure.
    /// A rowgroup contains one or more rows of cells, grid cells, column headers, or row headers within a grid, table or treegrid.
    ///
    /// (use `<thead>`, `<tfoot>` and `<tbody>`)
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Roles/rowgroup_role)
    public static var rowGroup: ARIARoleType { .init(value: "rowgroup") }
    
    /// An element with role="rowheader" is a cell containing header information for a row within a tabular structure of a grid, table or treegrid.
    ///
    /// (use `<th scope="row">`)
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Roles/rowheader_role)
    public static var rowHeader: ARIARoleType { .init(value: "rowheader") }
    
    /// The separator role indicates the element is a divider that separates and distinguishes sections
    /// of content or groups of menuitems. The implicit ARIA role the native thematic break `<hr>` element is separator.
    ///
    /// (use `<hr>` if it doesn't have focus)
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Roles/separator_role)
    public static var separator: ARIARoleType { .init(value: "separator") }
    
    /// The table value of the ARIA role attribute identifies the element containing the role
    /// as having a non-interactive table structure containing data arranged in rows
    /// and columns, similar to the native `<table>` HTML element.
    ///
    /// (use `<table>`)
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Roles/table_role)
    public static var table: ARIARoleType { .init(value: "table") }
    
    /// Word or phrase with an optional corresponding definition.
    /// Prohibited attributes: aria-label and aria-labelledby.
    ///
    /// (use `<dfn>`)
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Roles/term_role)
    public static var term: ARIARoleType { .init(value: "term") }
    
    // These are included for completeness, but in most cases are rarely, if ever, useful:
    
    /// Contains only associationlistitemkey children and their sibling associationlistitemvalue.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Roles/structural_roles)
    public static var associationList: ARIARoleType { .init(value: "associationlist") }
    
    /// Must be contained in an associationlist.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Roles/structural_roles)
    public static var associationListItemKey: ARIARoleType { .init(value: "associationlistitemkey") }
    
    /// Always a sibling following an associationlistitemkey.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Roles/structural_roles)
    public static var associationListItemValue: ARIARoleType { .init(value: "associationlistitemvalue") }
    
    /// A section of content that is quoted from another source.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Roles/structural_roles)
    public static var blockQuote: ARIARoleType { .init(value: "blockquote") }
    
    /// Visible content that names, and may also describe, a figure, table, grid, or treegrid.
    /// Only found in those 4 roles. A caption's id is generally referenced by a figure, grid, table, or treegrid's aria-labelledby attribute.
    /// Prohibited attributes: aria-label and aria-labelledby.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Roles/structural_roles)
    public static var caption: ARIARoleType { .init(value: "caption") }
    
    /// A section representing a fragment of computer code.
    /// Prohibited attributes: aria-label and aria-labelledby.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Roles/structural_roles)
    public static var code: ARIARoleType { .init(value: "code") }
    
    /// Content that is marked as removed or suggested for removal.
    /// Prohibited attributes: aria-label and aria-labelledby.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Roles/structural_roles)
    public static var deletion: ARIARoleType { .init(value: "deletion") }
    
    /// Used to stress or emphasize content, but not to suggest importance.
    /// Prohibited attributes: aria-label and aria-labelledby.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Roles/structural_roles)
    public static var emphasis: ARIARoleType { .init(value: "emphasis") }
    
    /// Content that is marked as added or content that is being suggested for addition.
    /// Prohibited attributes: aria-label and aria-labelledby.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Roles/structural_roles)
    public static var insertion: ARIARoleType { .init(value: "insertion") }
    
    /// A paragraph of content.
    /// Prohibited attributes: aria-label and aria-labelledby.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Roles/structural_roles)
    public static var paragraph: ARIARoleType { .init(value: "paragraph") }
    
    /// Important, serious, or urgent content.
    /// Prohibited attributes: aria-label and aria-labelledby.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Roles/structural_roles)
    public static var strong: ARIARoleType { .init(value: "strong") }
    
    /// One or more subscripted characters.
    /// Only use if absence of role would change the content's meaning.
    /// Prohibited attributes: aria-label and aria-labelledby.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Roles/structural_roles)
    public static var `subscript`: ARIARoleType { .init(value: "subscript") }
    
    /// One or more superscripted characters.
    /// Only use if absence of role would change the content's meaning.
    /// Prohibited attributes: aria-label and aria-labelledby.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Roles/structural_roles)
    public static var superScript: ARIARoleType { .init(value: "superscript") }
    
    /// A valid date or time string format list a specific point in time.
    /// Prohibited attributes: aria-label and aria-labelledby.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Roles/structural_roles)
    public static var time: ARIARoleType { .init(value: "time") }
    
    // MARK: - Widget roles
    
    /// <#T##Result#>
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Roles/scrollbar_role)
    public static var scrollBar: ARIARoleType { .init(value: "scrollbar") }
    
    /// <#T##Result#>
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Roles/searchbox_role)
    public static var searchBox: ARIARoleType { .init(value: "searchbox") }
    
    /// <#T##Result#>
    ///
    /// (when focusable)
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Roles/separator_role)
    public static var separator: ARIARoleType { .init(value: "separator") }
    
    /// <#T##Result#>
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Roles/slider_role)
    public static var slider: ARIARoleType { .init(value: "slider") }
    
    /// <#T##Result#>
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Roles/spinbutton_role)
    public static var spinButton: ARIARoleType { .init(value: "spinbutton") }
    
    /// <#T##Result#>
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Roles/switch_role)
    public static var `switch`: ARIARoleType { .init(value: "switch") }
    
    /// <#T##Result#>
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Roles/tab_role)
    public static var tab: ARIARoleType { .init(value: "tab") }
    
    /// <#T##Result#>
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Roles/tabpanel_role)
    public static var tabPanel: ARIARoleType { .init(value: "tabpanel") }
    
    /// <#T##Result#>
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Roles/treeitem_role)
    public static var treeItem: ARIARoleType { .init(value: "treeitem") }
    
    // MARK: - Composite widget roles
    
    /// <#T##Result#>
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Roles/combobox_role)
    public static var comboBox: ARIARoleType { .init(value: "combobox") }
    
    /// <#T##Result#>
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Roles/menu_role)
    public static var menu: ARIARoleType { .init(value: "menu") }
    
    /// <#T##Result#>
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Roles/menubar_role)
    public static var menuBar: ARIARoleType { .init(value: "menubar") }
    
    /// <#T##Result#>
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Roles/tablist_role)
    public static var tabList: ARIARoleType { .init(value: "tablist") }
    
    /// <#T##Result#>
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Roles/tree_role)
    public static var tree: ARIARoleType { .init(value: "tree") }
    
    /// <#T##Result#>
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Roles/treegrid_role)
    public static var treeGrid: ARIARoleType { .init(value: "treegrid") }
    
    // MARK: - Landmark roles
    
    /// <#T##Result#>
    ///
    /// (document `<header>`)
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Roles/banner_role)
    public static var banner: ARIARoleType { .init(value: "banner") }
    
    /// <#T##Result#>
    ///
    /// (`<aside>(<aside>))
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Roles/complementary_role)
    public static var complementary: ARIARoleType { .init(value: "complementary") }
    
    /// <#T##Result#>
    ///
    /// (document `<footer>`)
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Roles/contentinfo_role)
    public static var contentInfo: ARIARoleType { .init(value: "contentinfo") }
    
    /// <#T##Result#>
    ///
    /// (`<form>`)
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Roles/form_role)
    public static var form: ARIARoleType { .init(value: "form") }
    
    /// <#T##Result#>
    ///
    /// (`<main>`)
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Roles/main_role)
    public static var main: ARIARoleType { .init(value: "main") }
    
    /// <#T##Result#>
    ///
    /// (`<nav>`)
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Roles/navigation_role)
    public static var navigation: ARIARoleType { .init(value: "navigation") }
    
    /// <#T##Result#>
    ///
    /// (`<section>`)
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Roles/region_role)
    public static var region: ARIARoleType { .init(value: "region") }
    
    /// <#T##Result#>
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Roles/search_role)
    public static var search: ARIARoleType { .init(value: "search") }
    
    // MARK: - Live region roles
    
    /// <#T##Result#>
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Roles/alert_role)
    public static var alert: ARIARoleType { .init(value: "alert") }
    
    /// <#T##Result#>
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Roles/log_role)
    public static var log: ARIARoleType { .init(value: "log") }
    
    /// <#T##Result#>
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Roles/marquee_role)
    public static var marquee: ARIARoleType { .init(value: "marquee") }
    
    /// <#T##Result#>
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Roles/status_role)
    public static var status: ARIARoleType { .init(value: "status") }
    
    /// <#T##Result#>
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Roles/timer_role)
    public static var timer: ARIARoleType { .init(value: "timer") }
    
    // MARK: - Window roles
    
    /// <#T##Result#>
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Roles/alertdialog_role)
    public static var alertDialog: ARIARoleType { .init(value: "alertdialog") }
    
    /// <#T##Result#>
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Roles/dialog_role)
    public static var dialog: ARIARoleType { .init(value: "dialog") }
    
}

//// MARK: - RoleAttrable
//
//public protocol RoleAttrable: DOMElement {
//    @discardableResult
//    func role(_ value: Bool) -> Self
//    @discardableResult
//    func role<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool
//}

//extension RoleAttrable {
//    /// ARIA roles provide semantic meaning to content, allowing screen readers and other tools
//    /// to present and support interaction with object in a way that is consistent
//    /// with user expectations of that type of object. ARIA roles can be used to describe elements
//    /// that don't natively exist in HTML or exist but don't yet have full browser support.
//    ///
//    /// Applicable to `<button>`, `<fieldset>`, `<input>`, `<keygen>`,
//    /// `<optgroup>`, `<option>`, `<select>`, `<textarea>`, `<style>`
//    ///
//    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Roles)
//    @discardableResult
//    public func role(_ value: Bool) -> Self {
//        setter.attribute("role", value, .keyWithoutValue)
//        return self
//    }
//
//    /// Indicates whether the user can interact with the element.
//    ///
//    /// Applicable to `<button>`, `<fieldset>`, `<input>`, `<keygen>`,
//    /// `<optgroup>`, `<option>`, `<select>`, `<textarea>`, `<style>`
//    ///
//    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/disabled)
//    @discardableResult
//    public func role<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool {
//        disabled(value.stateValue.wrappedValue)
////        value.stateValue.listen { self.disabled($0) }
//        return self
//    }
//}
//
//extension A: RoleAttrable {}
