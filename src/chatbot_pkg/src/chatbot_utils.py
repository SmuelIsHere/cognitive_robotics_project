import json
import rospy

# Contesto fisso per il chatbot
BASE_CONTEXT = """
Ciao, sono Pepper, il robot guardiano del centro commerciale.
Rispondo in modo garbato e energetico.
Conosco tutti i dettagli sulla competizione in corso e i suoi partecipanti, e sui clienti del centro commerciale.
Se qualcuno è in difficoltà ed ha bisogno del mio aiuto, farò del mio meglio basandomi sui dati che ho a disposizione sulla competizione e sul centro commerciale.
Se qualcuno ha perso una persona, cercherò di aiutarlo basandomi sui dati della competizione e del centro commerciale.
Posso rispondere a domande sui risultati, sulla classifica e sui membri delle squadre.
Se mi fai domande fuori da questi argomenti, ti informerò gentilmente che posso aiutarti solo sulla competizione o sul centro commerciale.
Rispondo in modo breve, a meno che tu non chieda approfondimenti.
Rispondo come se stessi parlando con una persona faccia a faccia, senza usare parentesi.
Distinguo se si sta parlando di un ragazzo o una ragazza, figlio o figlia, uomo o donna.
Rispondo subito, non faccio aspettare per cercare informazioni, le conosco già.
Non sono in grado di contattare i clienti.
Non chiedo l'età.
Rispondo in modo empatico quando serve.
Non rispondo costantemente con ciao, solo all'inizio.
"""

def load_json(filename):
    """Carica un file JSON e restituisce i dati."""
    try:
        with open(filename, "r", encoding="utf-8") as file:
            return json.load(file)
    except FileNotFoundError:
        rospy.logerr(f"Errore: Il file {filename} non esiste.")
        return {}

def analyze_participants(data_results):
    """\nDettagli delle persone nel centro commerciale, la trajectory indica rispettivamente le zone in cui sono passati delineando il percorso che hanno fatto."""
    people = data_results.get("people", [])
    
    total_count = len(people)
    hat_count = sum(1 for p in people if p["hat"] == 1)
    bag_count = sum(1 for p in people if p["bag"] == 1)
    male_count = sum(1 for p in people if p["gender"] == "Male")
    female_count = sum(1 for p in people if p["gender"] == "Female")

    details = "\nDettagli delle persone nel centro commerciale, la trajectory indica rispettivamente le zone in cui sono passati delineando il percorso che hanno fatto:\n"
    for p in people:
        details += (
            f"ID {p['id']} - Genere: {p['gender']}, "
            f"Cappello: {'Sì' if p['hat'] else 'No'}, "
            f"Zaino: {'Sì' if p['bag'] else 'No'}, "
            f"Percorso: {p['trajectory']}\n"
        )

    return (
        f"Statistiche sui partecipanti:\n"
        f"Totale: {total_count}\n"
        f"Con cappello: {hat_count}\n"
        f"Con zaino: {bag_count}\n"
        f"Uomini: {male_count}\n"
        f"Donne: {female_count}\n"
        f"{details}"
    )

def generate_context(data_results, data_ranking):
    """Genera il contesto del chatbot basato sui dati della competizione."""
    context = BASE_CONTEXT + "\n\nDati della competizione:\n"
    context += analyze_participants(data_results)

    # Legge correttamente il ranking come posizione -> team_id
    first_place_team = None
    for pos, team_id in data_ranking.get("ranking_position", {}).items():
        if str(pos) == "1":  # Controlla la prima posizione
            first_place_team = team_id
            break

    if first_place_team:
        members = ", ".join(data_ranking["group_members"].get(str(first_place_team), []))
        afs_score = data_ranking["AFS"].get(str(first_place_team), "N/A")
        context += (
            f"\nLa squadra al primo posto è il Team {first_place_team}.\n"
            f"Punteggio: {afs_score}\n"
            f"Membri: {members}\n"
        )

    context += "\nClassifica generale:\n"
    for pos, team_id in sorted(data_ranking.get("ranking_position", {}).items(), key=lambda x: int(x[0])):
        afs_score = data_ranking["AFS"].get(str(team_id), "N/A")
        members = ", ".join(data_ranking["group_members"].get(str(team_id), []))
        context += f"Posizione {pos}: Team {team_id} (Punteggio: {afs_score}) - Membri: {members}\n"

    return context
