package main

import (
	"net/http"
	"net/http/httptest"
	"testing"
)

func Test_getRoot(t *testing.T) {
	type args struct {
		uri  string
		want int
	}

	tests := []struct {
		name string
		args args
	}{
		{
			name: "test1",
			args: args{uri: "/", want: http.StatusOK},
		},
	}
	rr := httptest.NewRecorder()
	handler := http.HandlerFunc(getRoot)
	for _, tt := range tests {
		req, err := http.NewRequest("GET", tt.args.uri, nil)
		if err != nil {
			t.Fatalf("fail to create request: %s", err.Error())
		}
		handler.ServeHTTP(rr, req)
		if status := rr.Code; status != tt.args.want {
			t.Errorf("handler returned wrong status code: got %v want %v",
				status, http.StatusOK)
		}

	}
}
