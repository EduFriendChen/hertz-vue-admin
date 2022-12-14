package response

import "github.com/edufriendchen/hertz-vue-admin/server/model/system"

type SysAuthorityResponse struct {
	Authority system.SysAuthority `json:"authority"`
}

type SysAuthorityCopyResponse struct {
	Authority      system.SysAuthority `json:"authority"`
	OldAuthorityId uint                `json:"oldAuthorityId" vd:"$>0"` // 旧角色ID
}
