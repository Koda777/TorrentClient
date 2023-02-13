#include <wx/wx.h>

class MonPremierProgramme : public wxFrame {
public:
  MonPremierProgramme(const wxString &titre);
};

MonPremierProgramme::MonPremierProgramme(const wxString &titre)
    : wxFrame(NULL, wxID_ANY, titre) {
  // Centrer la fenêtre sur l'écran
  Centre();
}

class MonApplication : public wxApp {
public:
  virtual bool OnInit();
};

IMPLEMENT_APP(MonApplication)

bool MonApplication::OnInit() {
  MonPremierProgramme *fenetre =
      new MonPremierProgramme("Mon premier programme wxWidgets");
  fenetre->Show(true);
  return true;
}
