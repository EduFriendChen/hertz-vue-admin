package system

import (
	"github.com/edufriendchen/hertz-vue-admin/server/global"
)

type SysApi struct {
	global.MODEL
	Path        string `json:"path" gorm:"comment:api路径" vd:"len($)>0"`             // api路径
	Description string `json:"description" gorm:"comment:api中文描述" vd:"len($)>0"`    // api中文描述
	ApiGroup    string `json:"apiGroup" gorm:"comment:api组" vd:"len($)>0"`          // api组
	Method      string `json:"method" gorm:"default:POST;comment:方法" vd:"len($)>0"` // 方法:创建POST(默认)|查看GET|更新PUT|删除DELETE
}

func (SysApi) TableName() string {
	return "sys_apis"
}
