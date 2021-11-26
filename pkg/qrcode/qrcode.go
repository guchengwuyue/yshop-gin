package qrcode

import (
	"github.com/boombuler/barcode"
	"github.com/boombuler/barcode/qr"
	"image/jpeg"
	"yixiang.co/go-mall/pkg/file"
	"yixiang.co/go-mall/pkg/global"
	"yixiang.co/go-mall/pkg/util"
)

type QrCode struct {
	URL    string
	Width  int
	Height int
	Ext    string
	Level  qr.ErrorCorrectionLevel
	Mode   qr.Encoding
}

const (
	EXT_JPG = ".jpg"
)

// NewQrCode initialize instance
func NewQrCode(url string, width, height int, level qr.ErrorCorrectionLevel, mode qr.Encoding) *QrCode {
	return &QrCode{
		URL:    url,
		Width:  width,
		Height: height,
		Level:  level,
		Mode:   mode,
		Ext:    EXT_JPG,
	}
}

// GetQrCodePath get save path
func GetQrCodePath() string {
	return global.YSHOP_CONFIG.App.QrCodeSavePath
}

// GetQrCodeFullPath get full save path
func GetQrCodeFullPath() string {
	return global.YSHOP_CONFIG.App.RuntimeRootPath + global.YSHOP_CONFIG.App.QrCodeSavePath
}

// GetQrCodeFullUrl get the full access path
func GetQrCodeFullUrl(name string) string {
	return global.YSHOP_CONFIG.App.PrefixUrl + "/" + GetQrCodePath() + name
}

// GetQrCodeFileName get qr file name
func GetQrCodeFileName(value string) string {
	return util.EncodeMD5(value)
}

// GetQrCodeExt get qr file ext
func (q *QrCode) GetQrCodeExt() string {
	return q.Ext
}

// Encode generate QR code
func (q *QrCode) Encode(path string) (string, string, error) {
	name := GetQrCodeFileName(q.URL) + q.GetQrCodeExt()
	src := path + name
	if file.CheckNotExist(src) == true {
		code, err := qr.Encode(q.URL, q.Level, q.Mode)
		if err != nil {
			return "", "", err
		}

		code, err = barcode.Scale(code, q.Width, q.Height)
		if err != nil {
			return "", "", err
		}

		f, err := file.MustOpen(name, path)
		if err != nil {
			return "", "", err
		}
		defer f.Close()

		err = jpeg.Encode(f, code, nil)
		if err != nil {
			return "", "", err
		}
	}

	return name, path, nil
}