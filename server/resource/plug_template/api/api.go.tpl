package api

import (
	"github.com/edufriendchen/hertz-vue-admin/server/global"
	"github.com/edufriendchen/hertz-vue-admin/server/model/common/response"
{{ if .NeedModel }}	"github.com/edufriendchen/hertz-vue-admin/server/plugin/{{ .Snake}}/model" {{ end }}
	"github.com/edufriendchen/hertz-vue-admin/server/plugin/{{ .Snake}}/service"
	"go.uber.org/zap"
)

type {{ .PlugName}}Api struct{}

// @Tags {{ .PlugName}}
// @Summary 请手动填写接口功能
// @Produce  application/json
// @Success 200 {string} string "{"success":true,"data":{},"msg":"发送成功"}"
// @Router /{{ .RouterGroup}}/routerName [post]
func (p *{{ .PlugName}}Api) ApiName(ctx context.Context, c *app.RequestContext) {
    {{ if .HasRequest}}
        var plug model.Request
        _ = c.ShouldBindJSON(&plug)
    {{ end }}
        if {{ if .HasResponse }} res, {{ end }} err:= service.ServiceGroupApp.PlugService({{ if .HasRequest }}plug{{ end -}}); err != nil {
		global.LOG.Error("失败!", zap.Error(err))
		response.FailWithMessage("失败", c)
	} else {
	{{if .HasResponse }}
	    response.OkWithDetailed(res,"成功",c)
	{{else}}
	    response.OkWithData("成功", c)
	{{ end -}}

	}
}
