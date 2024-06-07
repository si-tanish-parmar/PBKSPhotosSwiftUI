//
//  SIFeedsDetailListing.swift
//  Bolts
//
//  Created by Siddharth Daga on 5/27/19.
//

import Foundation

// MARK: - SIFeedsDetailModel
struct SIFeedsDetailModel: Codable {
    let status: Int?
    let content: SIFeedsDetailModelContent?
    let applicationDomain: String?
    let data: String?
    let imagesData: String?
    let authodata: String?
    let nextPrev: String?
    let entityData: String?
    let relatedArticle: String?
    let message: String?
    let responseStatus: String?
    let fetchFromCache: Bool?
    let asyncCall: Bool?
    let time: String?
    let meta: String?

    enum CodingKeys: String, CodingKey {
        case status
        case content
        case applicationDomain = "ApplicationDomain"
        case data
        case imagesData = "ImagesData"
        case authodata = "Authodata"
        case nextPrev = "NextPrev"
        case entityData = "EntityData"
        case relatedArticle = "RelatedArticle"
        case message
        case responseStatus = "response_status"
        case fetchFromCache = "fetchfromcache"
        case asyncCall = "asycncall"
        case time
        case meta
    }
}

// MARK: - Content
struct SIFeedsDetailModelContent: Codable {
    let data: SIFeedsDetailModelContentData?
    
    enum CodingKeys: String, CodingKey {
        case data
    }
}

// MARK: - ContentData
struct SIFeedsDetailModelContentData: Codable {
    let title: String?
    let slugURL: String?
    let images: [SIFeedsDetailModelImage]?
    let entitydata: [SIFeedsDetailEntityDataPhotos]?
    let albumID: String?
    let assetType: String?
    let publishedDate: String?
    let seo: SIFeedsDetailSeo?
    let guid: String?
    let status: String?
    let editedBy: String?
    let fullText: String?
    let userName: String?
    let albumDesc: String?
    let albumMeta: String?
    let albumType: String?
    let createdBy: String?
    let isPublish: String?
    let isTrashed: String?
    let partnerID: String?
    let updatedBy: String?
    let authorData: [SIFeedsDetailAuthorData]?
    let shortTitle: String?
    let showInApp: String?
    let showInWeb: String?
    let titleAlias: String?
    let uploadedBy: String?
    let coverDetails: String?
    let createdDate: String?
    let totalAssets: String?
    let browserTitle: String?
    let modifiedDate: String?
    let additionalInfo: String?
    let showCopyright: String?
    let showInMobile: String?
    let versionNumber: String?
    let publishedDate1: String?
    let coverDetailsStr: String?
    let contentSourceID: String?
    let focusByKeywords: String?
    let additionalInfoStr: String?
    let contentSourceLink: String?
    let contentProviderLink: String?
    let contentProviderLogo: String?
    let contentProviderName: String?

    enum CodingKeys: String, CodingKey {
        case title
        case slugURL = "slug_url"
        case images
        case entitydata
        case albumID = "album_id"
        case assetType = "asset_type"
        case publishedDate = "published_date"
        case seo
        case guid
        case status
        case editedBy = "edited_by"
        case fullText = "full_text"
        case userName = "user_name"
        case albumDesc = "album_desc"
        case albumMeta = "album_meta"
        case albumType = "album_type"
        case createdBy = "created_by"
        case isPublish = "is_publish"
        case isTrashed = "is_trashed"
        case partnerID = "partner_id"
        case updatedBy = "updated_by"
        case authorData = "author_data"
        case shortTitle = "short_title"
        case showInApp = "show_in_app"
        case showInWeb = "show_in_web"
        case titleAlias = "title_alias"
        case uploadedBy = "uploaded_by"
        case coverDetails = "CoverDetails"
        case createdDate = "created_date"
        case totalAssets = "total_assets"
        case browserTitle = "browser_title"
        case modifiedDate = "modified_date"
        case additionalInfo = "AdditionalInfo"
        case showCopyright = "show_copyright"
        case showInMobile = "show_in_mobile"
        case versionNumber = "version_number"
        case publishedDate1 = "published_date1"
        case coverDetailsStr = "CoverDetails_Str"
        case contentSourceID = "content_source_id"
        case focusByKeywords = "focus_by_keywords"
        case additionalInfoStr = "AdditionalInfo_Str"
        case contentSourceLink = "content_source_link"
        case contentProviderLink = "content_provider_link"
        case contentProviderLogo = "content_provider_logo"
        case contentProviderName = "content_provider_name"
    }
}

// MARK: - Seo
struct SIFeedsDetailSeo: Codable {
    let keywords: String?
    let focusKey: String?
    let metaDesc: String?
    let customMeta: String?
    let metaFields: String?
    let metaRobots: String?
    let browserTitle: String?
    let canonicalURL: String?

    enum CodingKeys: String, CodingKey {
        case keywords
        case focusKey = "focus_key"
        case metaDesc = "meta_desc"
        case customMeta = "custom_meta"
        case metaFields = "meta_fields"
        case metaRobots = "meta_robots"
        case browserTitle = "browser_title"
        case canonicalURL = "canonical_url"
    }
}

// MARK: - Image
struct SIFeedsDetailModelImage: Codable {
    let data: SIFeedsDetailModelImageData?
    let entitydata: [SIFeedsDetailEntityDataPhotos]?
    
    enum CodingKeys: String, CodingKey {
        case data
        case entitydata
    }
}

// MARK: - ImageData
struct SIFeedsDetailModelImageData: Codable {
    let title: String?
    let status, imageID, isCover, imageName: String?
    let imagePath: String?
    let isActive, isDelete: String?
    let phototypeID, positionID: Int?
    let orderNumber: String?
    let imageAlt: String?
    let imageDesc: String?
    let imageCaption: String?
    let mobileImageID: String?
    let imageCopyright: String?
    let mobileImageName: String?
    let mobileImagePath: String?

    enum CodingKeys: String, CodingKey {
        case title, status
        case imageID = "image_id"
        case isCover = "is_cover"
        case imageName, imagePath
        case isActive = "is_active"
        case isDelete = "is_delete"
        case phototypeID = "phototypeid"
        case positionID = "position_id"
        case orderNumber = "order_number"
        case imageAlt = "image_alt"
        case imageDesc = "image_desc"
        case imageCaption = "image_caption"
        case mobileImageID = "mobileImageID"
        case imageCopyright = "image_copyright"
        case mobileImageName = "mobileImageName"
        case mobileImagePath = "mobileImagePath"
    }
}

// MARK: - Entitydatum
public struct SIFeedsDetailEntityDataPhotos: Codable {
    public let priority, entityRoleMapID: Int?
    public let name: String?
    public let isVisible, isLinkable: String?
    public let assetID: Int?
    public let entDispName: String?
    public let isLang: String?
    public let canonical: String?
    public let contentCount: Int?
    public let entityTypeName: String?
    public let entityURL: String?
    public let entityTypeID: Int?
    public let entityURLType: String?

    enum CodingKeys: String, CodingKey {
        case priority
        case entityRoleMapID = "entity_role_map_id"
        case name
        case isLinkable = "is_linkable"
        case isVisible = "is_visible"
        case assetID = "asset_id"
        case entDispName = "ent_disp_name"
        case isLang = "is_lang"
        case canonical
        case contentCount = "content_count"
        case entityTypeName = "entity_type_name"
        case entityURL = "entity_url"
        case entityTypeID = "entity_type_id"
        case entityURLType = "entity_url_type"
    }
}

// MARK: - AuthorData
public struct SIFeedsDetailAuthorData: Codable {
    public let actionID: String?
    public let authorID: String?
    public let userCode: String?

    enum CodingKeys: String, CodingKey {
        case actionID = "action_id"
        case authorID = "author_id"
        case userCode = "user_code"
    }
}
