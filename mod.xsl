<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:oxm="https://www.openxsl.com">
    <xsl:template match="/root" name="wurui.user-ext-edit">
        <!-- className 'J_OXMod' required  -->
        <!--
		<slogan>我们掌握着改变世界的力量</slogan>
            <sex>X</sex>
            <img>http://i.oxm1.cc/uploads/git/wurui/img/2ajyf6sg4Tizdxut9oRw8uxC3pm.jpg</img>
            <uid>git/wurui</uid>
            <avatar>http://i.oxm1.cc/uploads/git/wurui/img/2ajyf6sh3Tizdxut8pRxh09Rq69.jpg</avatar>
            <nick>wurui</nick>
        -->
        <div class="J_OXMod oxmod-user-ext-edit" ox-mod="user-ext-edit">
        	<xsl:variable name="user" select="data/user-ext/i[1]"/>
            <xsl:variable name="gen_id" select="generate-id(.)"/>
            <input type="hidden" id="J_referer" value="{h/referer}"/>
            <form>
                <section>
                    <xsl:if test="not($user/uid)"><xsl:attribute name="class">nodata</xsl:attribute></xsl:if>
                    <div style="display:none;">
                        <input type="file" name="file_avatar" id="user_avatar_{$gen_id}"/>
                        <input type="file" name="file_img" id="user_img_{$gen_id}"/>
                    </div>
                	<input type="hidden" name="uid" value="{$user/uid}"/>
                	<div class="form-field">

                		<label class="avatar" for="user_avatar_{$gen_id}">
                			<xsl:if test="$user/avatar">
                				<xsl:attribute name="style">background-image:url(<xsl:value-of select="$user/avatar"/>)</xsl:attribute>
                			</xsl:if>
                		</label>            		
                	</div>
                    <div class="form-field">
                        <input class="textinput" type="text" name="nick" placeholder="输入用户昵称" value="{$user/nick}"/>
                    </div>
                    <div class="form-field">
                        <select value="{$user/sex}" name="sex">
                            <option value="">请选择性别</option>
                            <option value="X"><xsl:if test="$user/sex = 'X'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if>保密</option>
                            <option value="F"><xsl:if test="$user/sex = 'F'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if>女</option>
                            <option value="M"><xsl:if test="$user/sex = 'M'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if>男</option>
                        </select>
                    </div>
                    <div class="form-field">
                        <input class="textinput" type="text" name="slogan" placeholder="个性签名"  value="{$user/slogan}"/>
                    </div>
                	
                	
                	<div class="form-field">
                		<label class="img" for="user_img_{$gen_id}">
                			<xsl:if test="$user/img">
                				<xsl:attribute name="style">background-image:url(<xsl:value-of select="$user/img"/>)</xsl:attribute>
                			</xsl:if>
                		</label>
                	</div>
                    <div class="form-field">
                        <button class="bt-submit">提&#160;&#160;交</button>
                    </div>
                </section>
            </form>
        </div>
    </xsl:template>
</xsl:stylesheet>
